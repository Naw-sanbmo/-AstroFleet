class BookingsController < ApplicationController
  def index
    @upcoming_bookings = Booking.where("start_date >= ?", Date.current).order(:start_date)
    @past_bookings = Booking.where("start_date < ?", Date.current).order(start_date: :desc)
    # Assume that we have instant bookings only, no pending bookings.
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
