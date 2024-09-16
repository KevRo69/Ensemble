class Group < ApplicationRecord
  has_many :users, through: :group_users
  validates :name, presence: true
  validates :city, presence: true
  validates :description, presence: true, length: { minimum: 10 }
end
