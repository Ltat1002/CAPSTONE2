class ReportSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile, :address, :longitude, :latitude, :description, :amount_pay,
             :reason, :status, :repair_equipment_id, :user_send_id, :user_receive_id, :images,
             :created_at, :updated_at

  belongs_to :repair_equipment
  belongs_to :user_send, class_name: 'User', foreign_key: 'user_send_id'
  belongs_to :user_receive, class_name: 'User', foreign_key: 'user_receive_id'
  has_many :vouchers
end
