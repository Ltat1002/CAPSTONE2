class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :mobile, :address, :longitude, :latitude,
             :role, :description, :status, :onl_status, :repair_equipment_id, :created_at, :updated_at
  
  belongs_to :repair_equipment
end
