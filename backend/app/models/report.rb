class Report < ApplicationRecord
  belongs_to :repair_equipment
  belongs_to :user, class_name: 'User', optional: true
  has_many :vouchers
  has_many_attached :images
end
