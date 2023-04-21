class Review < ApplicationRecord
  belongs_to :report

  validates :rating, presence: true, numericality: { in: 1..5 }
end
