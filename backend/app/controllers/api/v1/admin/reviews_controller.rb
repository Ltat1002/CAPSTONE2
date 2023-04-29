class Api::V1::Admin::ReviewsController < ApplicationController
  before_action :check_admin
  before_action :set_review, only: %i[show destroy]

  def index
    @reviews = Review.all

    render json: @reviews
  end

  def show
    render json: @review
  end

  def destroy
    @review.destroy
    render json: { message: 'Delete successfully' }
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :report_id)
  end
end
