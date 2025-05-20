class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:new, :create, :edit, :update, :destroy]

  # for the renters
  def index
    if params[:query].present?
      @spaceships = Spaceship.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @spaceships = Spaceship.all
    end
  end


  def show
    @spaceship = Spaceship.find(params[:id])
    @booking = Booking.new
  end

  # for the spaceship owners
  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to @spaceship
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless @spaceship.user == current_user
  end

  def update
    if @spaceship.user == current_user && @spaceship.update(spaceship_params)
      redirect_to @spaceship
    else
      render :edit
    end
  end

  def destroy
    if @spaceship.user == current_user
      @spaceship.destroy
      redirect_to spaceships_path
    else
      redirect_to root_path
    end
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def spaceship_params
    params.require(:spaceship).permit(:name, :price, :max_speed, :features, :size)
  end

  def authenticate_owner!
    redirect_to root_path unless current_user&.owner?
  end
end
