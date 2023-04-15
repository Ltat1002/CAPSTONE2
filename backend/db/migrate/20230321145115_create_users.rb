class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :address
      t.float :longitude
      t.float :latitude
      t.integer :role, default: 0
      t.string :description
      t.integer :status, default: 0
      t.integer :onl_status, default: 0
      t.references :repair_equipment, foreign_key: true

      t.timestamps
    end
  end
end
