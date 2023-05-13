class Api::V1::Admin::ReportsController < ApplicationController
  before_action :check_admin
  before_action :set_report, only: :show

  def index
    @reports = Report.report_relation.newsest

    render json: @reports.map { |report| report&.show_all_report_json }
  end

  def show
    render json: @report.show_report_json
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end
end
