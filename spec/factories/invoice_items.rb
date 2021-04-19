FactoryBot.define do
  factory :invoice_item do
    property { build(:property, :with_contract) }
    invoice { build(:invoice) }
  end
end
