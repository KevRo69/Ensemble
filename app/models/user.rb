class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :groups, through: :group_users
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :address, presence: true
  validates :nickname, presence: true, length: { minimum: 3, maximum: 24 }
  validates :phone_number, format: { with: /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/ }
end
