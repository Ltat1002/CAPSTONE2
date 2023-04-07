class Api::V1::ReportsController < ApplicationController
  before_action :set_report, only: %i[ show update destroy ]

  # GET /reports
  def index
    @reports = current_user.reports.includes(:repair_equipment)

    render json: @reports.to_json(include: %i[ repair_equipment user ])
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = current_user.reports.build(report_params)

    if @report.save
      render json: @report.to_json(include: %i[ repair_equipment user ]), status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.permit(:report_mobile,
                    :report_address,
                    :report_ward,
                    :report_district,
                    :report_city,
                    :description,
                    :amount_pay,
                    :status,
                    :repair_equipment_id,
                    :user_id,
                    images: [])
    end
end
