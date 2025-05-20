class BookingsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
