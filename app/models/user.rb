class User < ActiveRecord::Base
  before_create :confirmation_token
  validates :email, presence: true
  validates :checkbox_ticked, presence: true
  validates :category, presence: true # http://stackoverflow.com/questions/13784845/how-would-one-validate-the-format-of-an-email-field-in-activerecord
	validates :email, email_format: { message: "doesn't look like an email address" }

	private
	def confirmation_token
	    if self.confirm_token.blank?
	      self.confirm_token = SecureRandom.urlsafe_base64.to_s
	    end
	end

end
