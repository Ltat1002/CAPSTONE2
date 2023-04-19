class Api::V1::Engineer::ReportsController < ApplicationController
  before_action :check_engineer
  before_action :set_report, only: %i[receive_report offer_price submit_report]

  def index
    @reports = Report.all

    render json: @reports
  end

  def receive_report
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def offer_price
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def submit_report
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.permit(:status, :amount_pay).merge(user_send_id: current_user.id)
  end
end
