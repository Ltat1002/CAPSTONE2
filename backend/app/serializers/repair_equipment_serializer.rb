class RepairEquipmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :photo, :created_at, :updated_at
end
