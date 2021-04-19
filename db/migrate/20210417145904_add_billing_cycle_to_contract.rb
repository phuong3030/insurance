class AddBillingCycleToContract < ActiveRecord::Migration[6.1]
  def change
    add_column :contracts, :billing_cycle, :integer
  end
end
