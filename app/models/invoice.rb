class Invoice < ApplicationRecord
  include Uneditable
  include Undestroyable
  validates_presence_of :payment_due

  scope :find_by_year, -> (year) {
    where('payment_due >= ?', DateTime.new(year, 1, 1))
  }

  scope :already_paid_by_year, -> (year) {
    find_by_year(year).inject(0.0) { |acc, cur| acc + cur.total }
  }

  scope :ordered_invoice_same_contract, -> (contract_id) {
    where(contract_id: contract_id).order("payment_due desc")
  }

  belongs_to :contract
  has_many :invoice_items

  before_validation :prepare_for_print_out, on: :create

  protected
  def prepare_for_print_out
    contract.properties.each do |prop|
      self.invoice_items << InvoiceItem.new(actual_price: prop.value, property_id: prop.id)
    end
    ordered_invoices = self.class.ordered_invoice_same_contract(contract.id)
    billing_cycle = self.contract.read_attribute_before_type_cast(:billing_cycle)
    self.payment_due = ((ordered_invoices.size > 0 ? ordered_invoices.first.payment_due : DateTime.now).at_beginning_of_month + (12 / billing_cycle.month).month).next_month
    self.total = (contract.yearly_premium - self.class.already_paid_by_year(self.payment_due.year)) / (billing_cycle - self.payment_due.month)
  end
end
