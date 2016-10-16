class UserMailer < ActionMailer::Base
  default :from => "contact@wyld.events"
  
  def registration_confirmation_fashionista(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => @user.email, :subject => "Wyld | Confirm your email address ")
  end

  def registration_confirmation_sponsor(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => @user.email, :subject => "Wyld | Confirm your email address ")
  end

  def registration_confirmation_host(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => @user.email, :subject => "Wyld | Confirm your email address ")
  end

  def registration_confirmation_streamer(user)
    @user = user
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => @user.email, :subject => "Wyld | Confirm your email address ")
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

