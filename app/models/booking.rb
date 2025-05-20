class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship
  validates :user_id, :spaceship_id, presence: true
  validates :spaceship_id, uniqueness: { scope: :user_id, message: "has already been booked by this user" }
end
