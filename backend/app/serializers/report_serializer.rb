class ReportSerializer < ActiveModel::Serializer
  attributes :id, :report_mobile, :report_address, :report_ward, :report_district, :report_city, :description,
             :amount_pay, :status, :repair_equipment_id, :user_send_id, :user_receive_id

  belongs_to :repair_equipment
  belongs_to :user_send, class_name: 'User', foreign_key: 'user_send_id'
  belongs_to :user_receive, class_name: 'User', foreign_key: 'user_receive_id'
  has_many :vouchers
end
