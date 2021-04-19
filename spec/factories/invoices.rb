FactoryBot.define do
  factory :invoice do
    contract { build(:contract) }
    payment_due { DateTime.now }

    trait :with_invoice_items do
      after(:build) do |invoice|
        invoice.invoice_items = build_list(:invoice_item, 5)
      end
    end
  end
end
