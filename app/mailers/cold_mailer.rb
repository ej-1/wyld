class ColdMailer < ApplicationMailer
  default :from => "contact@wyld.events"

  def cold_email_designer(recipient)
    @recipient = recipient
    mail(:to => @recipient, :subject => "Invitation to WYLD  |  Livestream your fashion")
  end

  def cold_email_blogger(recipient)
    @recipient = recipient
    mail(:to => @recipient, :subject => "Invitation to WYLD | Exclusively livestream fashion shows through your channel")
  end

end
