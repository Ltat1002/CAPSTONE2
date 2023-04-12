class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :comment
      t.references :user_send, null: false, foreign_key: { to_table: :users }
      t.references :user_receive, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
