class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :spaceships, dependent: :destroy
  
  has_many :reviews, dependent: :destroy
  has_one_attached :avatar

  has_many :bookings_as_owner, through: :spaceships, source: :bookings

end
