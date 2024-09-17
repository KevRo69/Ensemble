class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :groups, through: :group_users
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :nickname, presence: true, length: { maximum: 24 }
  validates :phone_number, presence: true, length: { minimum: 10, maximum: 10 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :bio, length: { maximum: 500 }
end
