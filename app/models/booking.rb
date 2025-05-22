class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship
  validates :user_id, :spaceship_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: { pending: "Pending", accepted: "Accepted", rejected: "Rejected" }

  scope :past, -> { where('end_date < ?', Date.today) }
  scope :future, -> { where('start_date > ?', Date.today) }
  scope :active, -> { where('start_date < ? AND end_date > ?', Date.today, Date.today) }
  scope :today, -> { accepted.where(date: Date.today) }
  scope :upcoming, -> { accepted.future }
  scope :need_response, -> { pending.future }
  scope :expired, -> { pending.past }
  scope :completed, -> { accepted.past }
  scope :not_rejected, -> { where.not(status: :rejected) }

  def number_of_days
    ( end_date - start_date ).to_i
  end

  def total_price
    spaceship.price * number_of_days
  end
end
