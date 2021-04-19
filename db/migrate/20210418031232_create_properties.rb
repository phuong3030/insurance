class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.decimal :value, :precision => 8, :scale => 2, default: 0.0
      t.references :contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
