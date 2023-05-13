class Api::V1::Engineer::ReportsController < ApplicationController
  before_action :check_engineer
  before_action :set_report, except: %i[index receive_history]

  def index
    @reports = Report.report_relation.where(repair_equipment_id: current_user.repair_equipment_id,
                                            user_receive_id: nil).order(created_at: :desc)

    render json: @reports.map { |report| report&.show_all_report_json }
  end

  def show
    if @report.repair_equipment_id == current_user.repair_equipment_id && @report.user_receive_id.nil?
      render json: @report.show_report_json
    else
      render json: { message: 'Does not exist' }, status: :not_found
    end
  end

  def receive_history
    @reports = Report.report_relation.where(user_receive_id: current_user.id).newest

    render json: @reports.map { |report| report&.show_all_report_json }
  end

  def receive_history_details
    if @report.user_receive_id == current_user.id
      render json: @report.show_report_json
    else
      render json: { message: 'Does not exist' }, status: :not_found
    end
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
    params.permit(:status, :amount_pay).merge(user_receive_id: current_user.id)
  end
end
