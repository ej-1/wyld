class User < ActiveRecord::Base
  before_create :confirmation_token
 
  validate :check_email
	validates :email, uniqueness: true, uniqueness: { message: "has already been registered." }

  validates :checkbox_ticked, presence: true
  validates :category, presence: true # http://stackoverflow.com/questions/13784845/how-would-one-validate-the-format-of-an-email-field-in-activerecord

	private
	def confirmation_token
	    if self.confirm_token.blank?
	      self.confirm_token = SecureRandom.urlsafe_base64.to_s
	    end
	end

  def check_email
    if email.blank?
    	errors.add(:email, " is required.")
    else
    	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    end
  end

end
