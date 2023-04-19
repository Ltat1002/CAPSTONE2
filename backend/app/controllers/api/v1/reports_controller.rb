class Api::V1::ReportsController < ApplicationController
  before_action :set_report, only: %i[show update destroy]

  def index
    @reports = Report.includes(:repair_equipment, :user_send, :user_receive, :vouchers)
                     .where(user_send_id: current_user.id).with_attached_images

    render json: @reports.map { |report|
      report.as_json(include: %i[user_send user_receive repair_equipment vouchers description])
            .merge({ images: url_for(report.images.first) })
    }
  end

  def show
    if @report.user_send_id == current_user.id
      render json: @report.as_json(include: %i[user_send user_receive repair_equipment
                                               vouchers description])
                          .merge(images: @report.images.map do |image|
                                           url_for(image)
                                         end)
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
                  :reason, :status, :repair_equipment_id, images: [])
          .merge(user_send_id: current_user.id)
  end
end
