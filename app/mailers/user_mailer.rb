class UserMailer < ActionMailer::Base
  default :from => "erikwjonsson@gmail.com"
  
  def registration_confirmation(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => @user.email, :subject => "Registered")
  end

	#def welcome_email(user)
  #  @user = user
  #  @url  = 'http://www.example.com'
  #  mail(to: @user.email, subject: 'Welcome to Example.com')
	#end
    #def email_activate
    #    self.email_confirmed = true
    #    self.confirm_token = nil
    #    save!(:validate => false)
    #end
end

