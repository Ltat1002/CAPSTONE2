require "test_helper"

class RepairEquipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repair_equipment = repair_equipments(:one)
  end

  test "should get index" do
    get repair_equipments_url, as: :json
    assert_response :success
  end

  test "should create repair_equipment" do
    assert_difference("RepairEquipment.count") do
      post repair_equipments_url, params: { repair_equipment: { eq_type: @repair_equipment.eq_type, name: @repair_equipment.name, price: @repair_equipment.price } }, as: :json
    end

    assert_response :created
  end

  test "should show repair_equipment" do
    get repair_equipment_url(@repair_equipment), as: :json
    assert_response :success
  end

  test "should update repair_equipment" do
    patch repair_equipment_url(@repair_equipment), params: { repair_equipment: { eq_type: @repair_equipment.eq_type, name: @repair_equipment.name, price: @repair_equipment.price } }, as: :json
    assert_response :success
  end

  test "should destroy repair_equipment" do
    assert_difference("RepairEquipment.count", -1) do
      delete repair_equipment_url(@repair_equipment), as: :json
    end

    assert_response :no_content
  end
end
