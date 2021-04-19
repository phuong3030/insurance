class ChangeBillingCycleFromContract < ActiveRecord::Migration[6.1]
  def change
    change_column :contracts, :billing_cycle, :integer, default: 12, null: false
  end
end
