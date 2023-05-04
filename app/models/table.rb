class Table < ApplicationRecord
  belongs_to :restaurant
  has_one :reservation
end
