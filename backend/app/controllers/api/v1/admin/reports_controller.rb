class Api::V1::Admin::ReportsController < ApplicationController
  before_action :check_admin
  before_action :set_report, only: :show

  def index
    @reports = Report.report_relation.newest

    render json: @reports.map { |report| report&.show_all_report_json }
  end

  def show
    render json: @report.show_report_json
  end

  def report_counting
    @report_done = Report.where(status: 6).count
    @report_cancel = Report.where(status: 7).count

    render json: { done: @report_done, cancel: @report_cancel }
  end

  def amount_pay_counting
    year = Report.where('EXTRACT(YEAR FROM updated_at) = ?', params[:year])
    jan = year.where('EXTRACT(MONTH FROM updated_at) = 1').sum(:amount_pay).to_f
    feb = year.where('EXTRACT(MONTH FROM updated_at) = 2').sum(:amount_pay).to_f
    mar = year.where('EXTRACT(MONTH FROM updated_at) = 3').sum(:amount_pay).to_f
    apr = year.where('EXTRACT(MONTH FROM updated_at) = 4').sum(:amount_pay).to_f
    may = year.where('EXTRACT(MONTH FROM updated_at) = 5').sum(:amount_pay).to_f
    jun = year.where('EXTRACT(MONTH FROM updated_at) = 6').sum(:amount_pay).to_f
    jul = year.where('EXTRACT(MONTH FROM updated_at) = 7').sum(:amount_pay).to_f
    aug = year.where('EXTRACT(MONTH FROM updated_at) = 8').sum(:amount_pay).to_f
    sep = year.where('EXTRACT(MONTH FROM updated_at) = 9').sum(:amount_pay).to_f
    oct = year.where('EXTRACT(MONTH FROM updated_at) = 10').sum(:amount_pay).to_f
    nov = year.where('EXTRACT(MONTH FROM updated_at) = 11').sum(:amount_pay).to_f
    dec = year.where('EXTRACT(MONTH FROM updated_at) = 12').sum(:amount_pay).to_f

    render json: {
      jan: jan, feb: feb, mar: mar, apr: apr, may: may, jun: jun, jul: jul, aug: aug, sep: sep, oct: oct,
      nov: nov, dec: dec
    }
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end
end
