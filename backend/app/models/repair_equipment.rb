class RepairEquipment < ApplicationRecord
  has_many :reports
  has_many :users
  has_one_attached :photo

  validates :name, :description, :photo, presence: true

  def photo_url
    Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
  end
end
