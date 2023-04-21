class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :report_id, :created_at, :updated_at

  belongs_to :report
end
