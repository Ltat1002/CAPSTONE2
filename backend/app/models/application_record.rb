class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :newest, -> { order(created_at: :desc) }
end
