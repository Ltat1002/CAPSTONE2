class Api::V1::Admin::UsersController < ApplicationController
  before_action :check_admin

  def index
    @users = User.all

    render json: @users
  end
end
