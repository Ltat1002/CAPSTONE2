class Api::V1::ReviewsController < ApplicationController
  before_action :set_review, only: :show
  before_action :set_review_for_report, only: :create

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    check = Review.find_by(report_id: params[:report_id])
    if check.present?
      render json: { message: 'Already review' }, status: :unprocessable_entity
    elsif @review.save
      render json: @review, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1
  # def update
  #   if @review.update(review_params)
  #     render json: @review
  #   else
  #     render json: @review.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /reviews/1
  # def destroy
  #   @review.destroy
  # end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_review_for_report
    @check = Review.find_by(report_id: params[:report_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :report_id)
  end
end
