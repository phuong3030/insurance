class Invoice < ApplicationRecord
  include Uneditable
  include Undestroyable

  belongs_to :contract

  before_create :calculate_total_price

  protected
  def calculate_total_price
    self.total = contract.theft_coverage - contract.deductible
  end
end
