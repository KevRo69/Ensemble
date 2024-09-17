class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_one_attached :photo
  validates :name, presence: true
  validates :city, presence: true
  validates :description, presence: true
end
