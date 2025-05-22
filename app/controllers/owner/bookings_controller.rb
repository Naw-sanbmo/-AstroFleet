class Owner::BookingsController < ApplicationController
  def index
    @spaceships = current_user.spaceships
  end
end
