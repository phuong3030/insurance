class Invoice < ApplicationRecord
  include Uneditable
  include Undestroyable

  belongs_to :contract

  before_create :calculate_total_price

  protected
  def calculate_total_price
    self.total = contract.yearly_premium
  end
end
