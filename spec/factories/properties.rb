FactoryBot.define do
  factory :property do
    sequence(:name) { |n| "name#{n.to_s}" }
    value { rand(0.0...100.0) }
  end
end
