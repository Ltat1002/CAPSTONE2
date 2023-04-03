class Api::V1::RepairEquipmentsController < ApplicationController
  before_action :set_repair_equipment, only: %i[ show update destroy ]

  # GET /repair_equipments
  def index
    @repair_equipments = RepairEquipment.all

    render json: @repair_equipments
  end

  # GET /repair_equipments/1
  def show
    render json: @repair_equipment
  end

  # POST /repair_equipments
  def create
    @repair_equipment = RepairEquipment.new(repair_equipment_params)

    if @repair_equipment.save
      render json: @repair_equipment, status: :created, location: @repair_equipment
    else
      render json: @repair_equipment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /repair_equipments/1
  def update
    if @repair_equipment.update(repair_equipment_params)
      render json: @repair_equipment
    else
      render json: @repair_equipment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /repair_equipments/1
  def destroy
    @repair_equipment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repair_equipment
      @repair_equipment = RepairEquipment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repair_equipment_params
      params.require(:repair_equipment).permit(:name, :eq_type, :price)
    end
end
