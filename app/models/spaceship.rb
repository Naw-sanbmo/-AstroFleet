class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  has_many :bookings

  private

  def photo_presence
    errors.add(:photo, "must be attached") unless photo.attached?
  end
end
