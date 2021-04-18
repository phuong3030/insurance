class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.decimal :total, :precision => 8, :scale => 2, default: 0.0
      t.references :contract, foreign_key: true, null: false

      t.timestamps
    end
  end
end
