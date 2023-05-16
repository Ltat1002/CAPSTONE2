class ApplicationController < ActionController::API
  include ExceptionHandler

  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def check_engineer
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user.engineer?
  end

  def check_admin
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user.admin?
  end

  def check_account_active
    @user = User.find_by(email: params[:email])
    render json: { message: 'Account deactivate' }, status: 423 if @user.deactivate?
  end
end
