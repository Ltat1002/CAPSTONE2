class Api::V1::ReportsController < ApplicationController
  before_action :set_report, only: %i[show update destroy]

  def index
    @reports = Report.includes(:repair_equipment, :user_send, :user_receive, :vouchers)
                     .where(user_send_id: current_user.id)

    render json: @reports
  end

  def show
    render json: @report
  end

  def create
    @report = Report.create(report_params)
    @report.user_send = current_user

    if @report.save
      render json: @report, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @report.destroy
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.permit(:name, :mobile, :address, :longitude, :latitude, :description, :amount_pay,
                  :reason, :status, :repair_equipment_id, :user_send_id, images: [])
  end
end
