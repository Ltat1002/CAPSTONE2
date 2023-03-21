class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :address
      t.string :technique
      t.integer :role, default: 0
      t.integer :status, default: 0
      t.references :ward, null: false, foreign_key: true

      t.timestamps
    end
  end
end
