class User < ActiveRecord::Base
  before_create :confirmation_token
  validates :email, presence: true
  validates :checkbox_ticked, presence: true
  validates :category, presence: true

	private
	def confirmation_token
	    if self.confirm_token.blank?
	      self.confirm_token = SecureRandom.urlsafe_base64.to_s
	    end
	end

end
