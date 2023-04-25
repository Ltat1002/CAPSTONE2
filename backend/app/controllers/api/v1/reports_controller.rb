class Api::V1::ReportsController < ApplicationController
  before_action :set_report, only: %i[show update]

  def index
    @reports = Report.includes(:repair_equipment, :user_send, :user_receive, :vouchers, :review)
                     .where(user_send_id: current_user.id).with_attached_images.with_all_rich_text

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

  # def destroy
  #   @report.destroy
  # end

  def search
    @report_search = Report.includes(:repair_equipment, :user_send, :user_receive, :vouchers, :review)
                           .joins(:rich_text_description).with_attached_images.with_all_rich_text
                           .where('action_text_rich_texts.body like ? or reports.name like ?',
                                  "%#{params[:search]}%", "%#{params[:search]}%")
    if @report_search.present?
      render json: @report_search.map { |report| report&.show_all_report_json }
    else
      render json: { message: 'Not found' }, status: :not_found
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
    params.permit(:name, :mobile, :address, :longitude, :latitude, :description, images: [])
  end
end
