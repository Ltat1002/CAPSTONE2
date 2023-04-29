class Api::V1::Admin::RepairEquipmentsController < ApplicationController
  before_action :check_admin
  before_action :set_repair_equipment, only: %i[show update]

  def index
    @repair_equipments = RepairEquipment.with_attached_photo

    render json: @repair_equipments.as_json(methods: :photo_url)
  end

  def show
    render json: @repair_equipment.as_json.merge(photo: url_for(@repair_equipment.photo))
  end

  def create
    @repair_equipment = RepairEquipment.new(repair_equipment_params)

    if @repair_equipment.save
      render json: @repair_equipment.as_json.merge(photo: url_for(@repair_equipment.photo)),
             status: :created
    else
      render json: @repair_equipment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @repair_equipment.update(repair_equipment_params)
      render json: @repair_equipment.as_json.merge(photo: url_for(@repair_equipment.photo))
    else
      render json: @repair_equipment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_repair_equipment
    @repair_equipment = RepairEquipment.find(params[:id])
  end

  def repair_equipment_params
    params.permit(:name, :description, :photo)
  end
end
