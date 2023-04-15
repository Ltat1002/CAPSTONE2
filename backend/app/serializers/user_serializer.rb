class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :first_name, :last_name, :mobile, :address, :longitude,
             :latitude, :role, :description, :status, :onl_status, :repair_equipment_id
  
  belongs_to :repair_equipment
end
