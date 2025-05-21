class Booking < ApplicationRecord
  enum status: [ :pending, :accepted, :rejected ]
  belongs_to :user
  belongs_to :spaceship
  validates :user_id, :spaceship_id, presence: true
end
