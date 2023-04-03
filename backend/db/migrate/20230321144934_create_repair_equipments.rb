class CreateRepairEquipments < ActiveRecord::Migration[7.0]
  def change
    create_table :repair_equipments do |t|
      t.string :name
      t.integer :eq_type, default: 0
      t.decimal :price, precision: 15, scale: 4

      t.timestamps
    end
  end
end
