class Contract < ApplicationRecord
  BILLING_CYCLES = { yearly: 1, quarterly: 4, monthly: 12 }
  enum billing_cycle: BILLING_CYCLES

  belongs_to :user
end
