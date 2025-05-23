class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @spaceship = Spaceship.find(params[:spaceship_id])
  end

  def create
    @review = Review.new(review_params)
    @spaceship = Spaceship.find(params[:spaceship_id])
    @review.spaceship = @spaceship
    @review.user = current_user

    if @review.save
      redirect_to spaceship_path(@spaceship), notice: "Review submitted successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @spaceship = Spaceship.find(params[:spaceship_id])
    @review.spaceship = @spaceship
    if @review.user == current_user
      @review.destroy
      redirect_to spaceship_path(@review.spaceship), notice: "Review deleted successfully."
    else
      redirect_to spaceship_path(@review.spaceship), alert: "You can only delete your own reviews."
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
