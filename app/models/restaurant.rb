class Restaurant < ApplicationRecord
  has_many :tables

  validates :name, :address, :city, presence: true
end
