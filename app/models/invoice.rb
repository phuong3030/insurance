class Invoice < ApplicationRecord
  include Uneditable
  include Undestroyable

  belongs_to :contract

  before_save :calculate_total_price

  protected
  def calculate_total_price
  end
end
