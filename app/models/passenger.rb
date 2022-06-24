class Passenger < ApplicationRecord
  has_and_belongs_to_many :bookings
  has_many :flights, through: :bookings

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
end
