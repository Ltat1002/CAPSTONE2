class Api::V1::RepairEquipmentsController < ApplicationController
  before_action :set_repair_equipment, only: :show

  def index
    @repair_equipments = RepairEquipment.with_attached_photo

    render json: @repair_equipments.as_json(methods: :photo_url)
  end

  def show
    render json: @repair_equipment.as_json.merge(photo: url_for(@repair_equipment.photo))
  end

  private

  def set_repair_equipment
    @repair_equipment = RepairEquipment.find(params[:id])
  end
end
