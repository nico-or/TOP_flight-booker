class Continent < ApplicationRecord
  has_many :countries
  has_many :airports, through: :countries
end
