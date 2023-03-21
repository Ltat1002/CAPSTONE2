class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :report_mobile
      t.string :report_address
      t.string :description
      t.decimal :amount_pay, precision: 15, scale: 4
      t.integer :status, default: 0
      t.references :repair_equipment, null: false, foreign_key: true
      t.references :ward, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
