class CreateVouchers < ActiveRecord::Migration[7.0]
  def change
    create_table :vouchers do |t|
      t.string :voucher_code
      t.decimal :sale, precision: 15, scale: 4
      t.date :using_date
      t.date :giving_date
      t.date :expired_date
      t.references :user, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
