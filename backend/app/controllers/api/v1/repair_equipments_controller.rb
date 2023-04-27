class Api::V1::RepairEquipmentsController < ApplicationController
  before_action :set_repair_equipment, only: :show

  def index
    @repair_equipments = RepairEquipment.with_attached_photo

    render json: @repair_equipments.as_json(methods: :photo_url)
  end

  def show
    render json: @repair_equipment.as_json.merge(photo: url_for(@repair_equipment.photo))
  end

  # # POST /repair_equipments
  # def create
  #   @repair_equipment = RepairEquipment.new(repair_equipment_params)

  #   if @repair_equipment.save
  #     render json: @repair_equipment, status: :created, location: @repair_equipment
  #   else
  #     render json: @repair_equipment.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /repair_equipments/1
  # def update
  #   if @repair_equipment.update(repair_equipment_params)
  #     render json: @repair_equipment
  #   else
  #     render json: @repair_equipment.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /repair_equipments/1
  # def destroy
  #   @repair_equipment.destroy
  # end

  private

  def set_repair_equipment
    @repair_equipment = RepairEquipment.find(params[:id])
  end

  def repair_equipment_params
    params.permit(:name, :description, :photo)
  end
end
