require 'rails_helper'

RSpec.describe Invoice, type: :model do
  subject { FactoryBot.create(:invoice) }

  it { should validate_presence_of(:payment_due) }

  it { should belong_to :contract }
  it { should have_many :invoice_items }
  it_behaves_like "uneditable"
  it_behaves_like "undestroyable"

  context 'calculates remaining price needed to pay' do
    it 'has total equal sum of invoice items actual price' do
      invoice = FactoryBot.build(:invoice, :with_invoice_items)
      expect(invoice.total).to(
        be_within(0.001).of(
          invoice.invoice_items.inject(0.0) { |acc, cur|
            acc + cur.actual_price / invoice.contract.read_attribute_before_type_cast(:billing_cycle)
          }
        )
      )
    end

    it 'finds by year' do
      invoices = (1..3).map do |i|
        FactoryBot.create(:invoice, payment_due: DateTime.new(2000, i, 1))
      end

      expect(Invoice.find_by_year(2000).size).to eq(invoices.size)
    end

    it 'gets total of prices same year invoices' do
      invoices = (1..3).map do |i|
        FactoryBot.create(:invoice, :with_invoice_items, payment_due: DateTime.new(2000, i, 1))
      end

      expect(Invoice.already_paid_by_year(2000)).to(
        be_within(0.001).of(invoices.inject(0.0) { |acc, cur| acc + cur.total })
      )
    end

    it 'find ordered invoice by same contract' do
      contract = FactoryBot.build(:contract)
      invoices = (1..3).map do |i|
        FactoryBot.create(:invoice, payment_due: DateTime.new(2000, i, 1), contract: contract)
      end

      expect(
        Invoice.ordered_invoice_same_contract(invoices[0].contract_id).pluck(:id)
      ).to eq(invoices.pluck(:id).reverse)
    end
  end
end
