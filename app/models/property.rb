class Property < ApplicationRecord
  belongs_to :contract
  validates_presence_of :name
end
