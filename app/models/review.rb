class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship
  validates :content, :rating, presence: true
end
