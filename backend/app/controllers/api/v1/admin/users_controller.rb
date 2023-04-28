class Api::V1::Admin::UsersController < ApplicationController
  before_action :check_admin
  before_action :set_user, only: :show

  def index
    @users = User.includes(:repair_equipment).with_all_rich_text

    render json: @users
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
