class Api::V1::ReportsController < ApplicationController
  before_action :set_report, only: %i[show update confirmed_offer cancel_report]

  def index
    @reports = Report.report_relation.where(user_send_id: current_user.id).newest

    render json: @reports.map { |report| report&.show_all_report_json }
  end

  def show
    if @report.user_send_id == current_user.id
      render json: @report.show_report_json
    else
      render json: { message: 'Does not exist' }, status: :not_found
    end
  end

  def create
    @report = Report.create(report_params.except(:images))
    if params[:images].present?
      params[:images].each do |image|
        @report.images.attach(image)
      end
    end

    if @report.save
      render json: @report.show_report_json, status: :created
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def update
    if @report.user_send_id == current_user.id
      if @report.update(report_update_params)
        render json: @report.show_report_json
      else
        render json: @report.errors, status: :unprocessable_entity
      end
    else
      render json: { message: 'Does not exist' }, status: :not_found
    end
  end

  def search
    @report_search = Report.report_relation.joins(:rich_text_description).newest
                           .where('(action_text_rich_texts.body like ? or reports.name like ?)
                                    and reports.user_send_id = ?', "%#{params[:search]}%",
                                  "%#{params[:search]}%", current_user.id)
    if @report_search.present?
      render json: @report_search.map { |report| report&.show_all_report_json }
    else
      render json: { message: 'Not found' }, status: :not_found
    end
  end

  def show_all_report
    @report_all = Report.report_relation.newest.find(params[:id])

    render json: @report_all.map { |report| report&.show_all_report_json }
  end

  def confirmed_offer
    if @report.update(report_update_params)
      render json: @report.show_report_json
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  def cancel_report
    if @report.update(report_update_params)
      render json: @report.show_report_json
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.permit(:name, :mobile, :address, :longitude, :latitude, :description, :amount_pay,
                  :reason, :status, :repair_equipment_id, images: [])
          .merge(user_send_id: current_user.id)
  end

  def report_update_params
    params.permit(:name, :mobile, :address, :longitude, :latitude, :description, :amount_pay,
                  :reason, :status, :repair_equipment_id, images: [])
  end
end
