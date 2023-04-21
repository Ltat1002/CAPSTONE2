class Report < ApplicationRecord
  belongs_to :repair_equipment
  belongs_to :user_send, class_name: 'User', foreign_key: 'user_send_id'
  belongs_to :user_receive, class_name: 'User', foreign_key: 'user_receive_id', optional: true
  has_many :vouchers
  has_one :review
  has_many_attached :images
  has_rich_text :description

  validates :name, :mobile, :address, :description, :images, presence: true
  validates :mobile, format: { with: /(84|0[3|5|7|8|9])+([0-9]{8}|[0-9]{9})\b/ }
end
