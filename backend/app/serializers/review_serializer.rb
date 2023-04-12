class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :user_send_id, :user_receive_id

  belongs_to :user_send, class_name: 'User', foreign_key: 'user_send_id'
  belongs_to :user_receive, class_name: 'User', foreign_key: 'user_receive_id'
end
