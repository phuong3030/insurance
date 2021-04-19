class Contract < ApplicationRecord
  BILLING_CYCLES = { yearly: 1, quarterly: 4, monthly: 12 }
  enum billing_cycle: BILLING_CYCLES

  has_many :properties
  has_many :invoices
  belongs_to :user

  validates_presence_of :billing_cycle

  def yearly_premium
    properties.inject(0.0) { |acc, cur| acc + cur.value }
  end
end
