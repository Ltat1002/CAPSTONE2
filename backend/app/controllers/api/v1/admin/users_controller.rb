class Api::V1::Admin::UsersController < ApplicationController
  before_action :check_admin
  before_action :set_user, only: %i[show accept_cv approve_cv deny_cv]

  def index
    @users = User.includes(:repair_equipment).with_all_rich_text.newest

    render json: @users
  end

  def show
    render json: @user
  end

  def show_engineer
    @users = User.includes(:repair_equipment).with_all_rich_text
                 .where(status: %i[pending accepted approved]).order(status: :asc, updated_at: :desc)

    render json: @users
  end

  def accept_cv
    @user.accepted!
    render json: @user
  end

  def approve_cv
    @user.approved! && @user.engineer!
    render json: @user
  end

  def deny_cv
    @user.activate! && @user.user!
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
