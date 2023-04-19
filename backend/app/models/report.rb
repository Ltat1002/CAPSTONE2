class Report < ApplicationRecord
  belongs_to :repair_equipment
  belongs_to :user_send, class_name: 'User', foreign_key: 'user_send_id'
  belongs_to :user_receive, class_name: 'User', foreign_key: 'user_receive_id', optional: true
  has_many :vouchers
  has_one :review
  has_many_attached :images
  has_rich_text :description

  validates :images, presence: true
end
