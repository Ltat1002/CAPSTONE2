class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, foreign_key: 'user_send_id'
  has_many :reviews, foreign_key: 'user_receive_id'
  has_many :reports, foreign_key: 'user_send_id'
  has_many :reports, foreign_key: 'user_receive_id'
  has_many :vouchers
  belongs_to :repair_equipment, optional: true

  enum role: %i[user engineer admin]

  alias authenticate valid_password?
end
