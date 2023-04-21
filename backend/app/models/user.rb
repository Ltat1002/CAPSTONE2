class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reports, foreign_key: 'user_send_id'
  has_many :reports, foreign_key: 'user_receive_id'
  has_many :vouchers
  belongs_to :repair_equipment, optional: true
  has_rich_text :description

  validates :first_name, :last_name, :mobile, :address, presence: true
  validates :password, format: {
    with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}\z/
  }
  validates :mobile, format: { with: /(84|0[3|5|7|8|9])+([0-9]{8}|[0-9]{9})\b/ }

  enum role: %i[user engineer admin]
  enum onl_status: %i[online offline]

  alias authenticate valid_password?
end
