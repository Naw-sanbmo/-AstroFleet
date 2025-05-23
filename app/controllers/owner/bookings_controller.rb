class Owner::BookingsController < ApplicationController
  def index
    @spaceships = current_user.spaceships
    @bookings = current_user.bookings_as_owner
  end
end
