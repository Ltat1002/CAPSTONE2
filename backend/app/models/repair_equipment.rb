class RepairEquipment < ApplicationRecord
  has_many :reports

  enum eq_type: %i[ cold hot ]
end
