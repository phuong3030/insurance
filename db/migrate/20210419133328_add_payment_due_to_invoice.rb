class AddPaymentDueToInvoice < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :payment_due, :datetime, null: false, precision: 6
  end
end
