class ReviewsController < ApplicationController
  def create
    @organ = Organ.find(params[:organ_id])
    @review = Review.new(review_params)
    @review.organ = @organ
    if @review.save
      redirect_to dashboard_path
    else
      # render :dashboard, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def review_params
    params.require(:review).permit(:comment, :rating)

  end
end
