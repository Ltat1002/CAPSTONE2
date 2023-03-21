class CreateWards < ActiveRecord::Migration[7.0]
  def change
    create_table :wards do |t|
      t.string :name
      t.integer :code
      t.string :codename
      t.string :division_type
      t.string :short_codename
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
