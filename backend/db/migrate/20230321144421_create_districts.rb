class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :code
      t.string :codename
      t.string :division_type
      t.string :short_codename

      t.timestamps
    end
  end
end
