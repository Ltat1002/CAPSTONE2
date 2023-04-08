class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[ create login ]
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email,
        :password,
        :password_confirmation,
        :first_name,
        :last_name,
        :mobile,
        :address,
        :technique,
        :role,
        :status)
    end
  end
