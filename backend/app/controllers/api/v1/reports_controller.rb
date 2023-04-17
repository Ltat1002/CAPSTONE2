class Api::V1::ReportsController < ApplicationController
  before_action :set_report, only: %i[show update destroy]

  def index
    @reports = Report.includes(:repair_equipment, :user_send, :user_receive, :vouchers)
                     .where(user_send_id: current_user.id).with_attached_images

    render json: @reports.map { |report|
      report.as_json(include: %i[user_send user_receive repair_equipment vouchers])
            .merge({ images: url_for(report.images.first) })
    }
  end

  def show
    render json: @report.as_json(include: %i[user_send user_receive repair_equipment vouchers])
                        .merge(images: @report.images.map do |image|
                                         url_for(image)
                                       end)
  end

  def create
    @report = Report.create(report_params.except(:images))
    @report.user_send = current_user

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
                  :reason, :status, :repair_equipment_id, :user_send_id, images: [])
  end
end
