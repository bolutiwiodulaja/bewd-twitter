class Session < ApplicationRecord
  before_validation :generate_session_token
  validates :user_id, presence: true

  belongs_to :user

  def generate_session_token
    self.token = SecureRandom.urlsafe_base64
  end
end
