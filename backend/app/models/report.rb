class Report < ApplicationRecord
  belongs_to :repair_equipment
  belongs_to :ward
  belongs_to :user
end
