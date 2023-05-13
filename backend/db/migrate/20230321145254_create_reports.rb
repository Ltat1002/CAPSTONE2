class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.string :mobile
      t.string :address
      t.decimal :longitude, precision: 15, scale: 8
      t.decimal :latitude, precision: 15, scale: 8
      t.decimal :amount_pay, precision: 15, scale: 4
      t.string :reason
      t.integer :status, default: 0
      t.references :repair_equipment, null: false, foreign_key: true
      t.references :user_send, null: false, foreign_key: { to_table: :users }
      t.references :user_receive, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
