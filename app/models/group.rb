class Group < ApplicationRecord
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
  has_many :users, through: :group_users
  has_one_attached :photo
  validates :name, presence: true
  validates :city, presence: true
  validates :description, presence: true
end
