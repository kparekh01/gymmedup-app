class Gym < ApplicationRecord
  has_many :users
  validates :address, uniqueness: true
end
