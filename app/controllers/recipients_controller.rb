class RecipientsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @recipients = Recipient.all.order('email ASC')
  end


  def import
    #Recipient.all.each do |recipient|
    #  recipient.delete
    #end

    Recipient.import(params[:file])
    @recipients = Recipient.all
    @recipients.each do |recipient|
      send_cold_email(recipient)
    end
    redirect_to recipients_url, notice: "Emails imported and emails sent."
  end


  def destroy
    Recipient.find(params[:id]).destroy
    redirect_to recipients_url, notice: "Recipient deleted!"
  end


  def edit
    @recipient = Recipient.find(params[:id])
  end


  def update
    respond_to do |format|
      @recipient = Recipient.find(params[:id])
      if @recipient.update(recipient_params)
        format.html { redirect_to recipients_url, notice: 'Recipient was successfully updated.' }
        send_cold_email(@recipient)
      else
        format.html { render :edit }
      end
    end
  end


private

  def send_cold_email(recipient)
    @recipient = recipient
    if @recipient.cold_email_sent != nil and @recipient.cold_email_sent.include? 'email sent'
    else
      if @recipient.name.include? 'blank'
        @recipient.name = ''
        puts @recipient.name
      else
         @recipient.name = ' ' + @recipient.name.to_s
         puts @recipient.name
      end

      if @recipient.category.include? 'blogger'
        ColdMailer.cold_email_blogger(@recipient).deliver # It does not care if there is a space " example@mail.com"
        @recipient.update(cold_email_sent: 'email sent as blogger')

      elsif @recipient.category.include? 'designer'
        ColdMailer.cold_email_designer(@recipient).deliver # It does not care if there is a space " example@mail.com"
        @recipient.update(cold_email_sent: 'email sent as designer')

      elsif @recipient.category == nil
        @recipient.update(cold_email_sent: "not sent: didn't specify user category")
      end
    end
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def recipient_params
    params.require(:recipient).permit(:file, :name, :email, :category, :authenticity_token, :recipient, :id, :cold_email_sent)
  end

end
