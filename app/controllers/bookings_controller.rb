class BookingsController < ApplicationController
  def index
    # TODO: the where statements are not working
    # @upcoming_bookings = current_user.bookings.where("start_date >= ?", Date.current).order(:start_date)
    # @past_bookings = current_user.bookings.where("start_date < ?", Date.current).order(start_date: :desc)
    @upcoming_bookings = Booking.future
    @past_bookings = Booking.past
    @spaceships = current_user.spaceships
    @booking_requests = Booking.need_response
    @review = Review.new

  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new(booking_params)
    @booking.spaceship = @spaceship
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      render "spaceships/show", status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      # redirect_to # up to you...
    else
      # render # where was the booking update form?
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
