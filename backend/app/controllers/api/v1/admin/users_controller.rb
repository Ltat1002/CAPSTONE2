class Api::V1::Admin::UsersController < ApplicationController
  before_action :check_admin
  before_action :set_user, except: %i[index show_engineer show_all_engineers user_counting]

  def index
    @users = User.includes(:repair_equipment).with_all_rich_text.newest.where(role: :user)

    render json: @users
  end

  def show
    render json: @user
  end

  def show_engineer
    @users = User.includes(:repair_equipment).with_all_rich_text
                 .where(status: :pending).order(status: :asc, updated_at: :desc)

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

  def activate_user
    @user.activate!
    render json: @user
  end

  def deactivate_user
    if @user.admin?
      render json: 'NGU'
    else
      @user.deactivate!
      render json: @user
    end
  end

  def edit_user
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show_all_engineers
    @users = User.includes(:repair_equipment).with_all_rich_text.newest.where(role: :engineer)

    render json: @users
  end

  def user_counting
    @end_user = User.where(role: :user).count
    @engineer = User.where(role: :engineer).count

    render json: { user: @end_user, engineer: @engineer }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :mobile,
                  :address, :longitude, :latitude, :repair_equipment_id, :description, :role, :status)
  end
end
