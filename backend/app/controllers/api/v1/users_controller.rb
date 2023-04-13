class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[ register login ]
  before_action :set_user, only: %i[ show destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def register
    @user = User.new(user_params)

    if @user.save
      render json: {
        message: 'User created successfully',
        data: @user
      }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    authenticate(params[:email], params[:password])
  end

  def authenticate(email, password)
    command = AuthenticateUser.call(email, password)
    if command.success?
      render json: {
        message: 'Login Successful',
        data: {
          accessToken: command.result,
          user: User.find_by(email: params[:email])
        }
      }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def edit_profile
    if current_user.update(user_params)
      render json: current_user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :mobile,
                  :address, :ward, :district, :city, :technique, :role, :status)
  end
end
