class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :address
      t.string :ward
      t.string :district
      t.string :city
      t.string :technique
      t.integer :role, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
