require 'rails_helper'
require Rails.root.join "spec/concerns/undestroyable_spec.rb"
require Rails.root.join "spec/concerns/uneditable_spec.rb"

RSpec.describe Invoice, type: :model do
  subject { FactoryBot.build(:invoice) }

  it { should belong_to :contract }
  it { should have_many :invoice_items }
  it_behaves_like "uneditable"
  it_behaves_like "undestroyable"
end
