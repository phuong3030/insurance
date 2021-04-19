require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  subject { FactoryBot.build(:invoice_item) }

  it { should belong_to :invoice }
  it { should belong_to :property }
  it_behaves_like "uneditable"
  it_behaves_like "undestroyable"
end
