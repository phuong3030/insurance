class RemoveTheftCoverageFromContract < ActiveRecord::Migration[6.1]
  def change
    remove_column :contracts, :theft_coverage, :decimal
  end
end
