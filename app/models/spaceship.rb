class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  private

  def photo_presence
    errors.add(:photo, "must be attached") unless photo.attached?
  end

end
