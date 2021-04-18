class Contract < ApplicationRecord
  BILLING_CYCLES = { yearly: 1, quarterly: 4, monthly: 12 }
  enum billing_cycle: BILLING_CYCLES

  has_many :properties
  belongs_to :user

  def yearly_premium
    0.0
  end
end
