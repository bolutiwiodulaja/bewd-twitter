class Tweet < ApplicationRecord
  validates :user_id, presence: true
  validates :message, presence: true, length: { maximum: 500 }

  belongs_to :user
end
