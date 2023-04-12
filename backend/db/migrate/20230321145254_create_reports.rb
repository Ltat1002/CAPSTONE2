class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :report_mobile
      t.string :report_address
      t.string :report_ward
      t.string :report_district
      t.string :report_city
      t.string :description
      t.decimal :amount_pay, precision: 15, scale: 4
      t.string :reason
      t.integer :status, default: 0
      t.references :repair_equipment, null: false, foreign_key: true
      t.references :user_send, null: false, foreign_key: { to_table: :users }
      t.references :user_receive, default: nil, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
