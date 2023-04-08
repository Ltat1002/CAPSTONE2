class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :reports, class_name: 'Report', foreign_key: 'user_send_id'
  has_many :vouchers

  enum role: %i[ user admin ]

  alias_method :authenticate, :valid_password?
end
