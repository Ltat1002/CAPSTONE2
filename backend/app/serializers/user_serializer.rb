class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :password_confirmation, :first_name, :last_name, :mobile,
             :address, :ward, :district, :city, :technique, :role, :status
end
