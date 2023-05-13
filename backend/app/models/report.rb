class Report < ApplicationRecord
  belongs_to :repair_equipment
  belongs_to :user_send, class_name: 'User', foreign_key: 'user_send_id'
  belongs_to :user_receive, class_name: 'User', foreign_key: 'user_receive_id', optional: true
  has_many :vouchers, dependent: :destroy
  has_one :review, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  has_rich_text :description

  validates :name, :mobile, :address, :description, :images, presence: true
  validates :mobile, format: { with: /(84|0[3|5|7|8|9])+([0-9]{8}|[0-9]{9})\b/ }, on: :create
  validates :reason, presence: { if: :cancelled? }

  enum status: %i[pending received offer confirmed done cancelled]

  scope :newest, -> { order(updated_at: :desc) }
  scope :report_relation, lambda {
    includes(:repair_equipment, :user_send, :user_receive, :vouchers, :review)
      .with_attached_images
      .with_all_rich_text
  }
  scope :available_report, -> { where.not(status: :cancelled) }

  def show_report_json
    as_json(include: %i[user_send user_receive repair_equipment vouchers description review])
      .merge(images: images.map do |image|
        Rails.application.routes.url_helpers.url_for(image)
      end)
  end

  def show_all_report_json
    as_json(include: %i[user_send user_receive repair_equipment vouchers description review])
      .merge({ images: Rails.application.routes.url_helpers.url_for(images.first) })
  end
end
