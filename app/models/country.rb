class Country < ApplicationRecord
  has_many :airports
  belongs_to :continent

  validates_presence_of :name, :code
end
