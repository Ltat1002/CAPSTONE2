class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[register login]

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
      render json: { message: 'Login Successful',
                     data: { accessToken: command.result,
                             user: User.find_by(email: params[:email]) } }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def profile
    render json: current_user
  end

  def edit_profile
    current_password = params[:current_password]
    if current_password.present?
      change_password(current_password)
    elsif current_user.update(user_params)
      render json: current_user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def change_password(current_password)
    user = AuthenticateUser.call(current_user.email, current_password)
    if user.success? && current_user.update(user_params)
      render json: current_user
    else
      render json: { message: 'Wrong current password' }, status: :unprocessable_entity
    end
  end

  def become_partner
    if current_user.update(eng_params)
      render json: current_user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # def destroy
  #   @user.destroy
  # end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :mobile,
                  :address, :longitude, :latitude, :repair_equipment_id, :description, :role, :status)
  end

  def eng_params
    params.permit(:role, :repair_equipment_id, :description, :address)
          .with_defaults(role: :engineer)
  end
end
