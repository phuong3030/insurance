class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.decimal :theft_coverage, :precision => 8, :scale => 2, default: 0.0
      t.decimal :deductible, :precision => 8, :scale => 2, default: 0.0
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
