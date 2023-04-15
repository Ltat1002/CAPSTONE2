class RepairEquipment < ApplicationRecord
  has_many :reports
  has_many :users
end
