class Ward < ApplicationRecord
  belongs_to :district
  has_many :users
  has_many :reports
end
