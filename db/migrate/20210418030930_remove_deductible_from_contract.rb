class RemoveDeductibleFromContract < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :deductible, :decimal
  end
end
