require 'rails_helper'
require Rails.root.join "spec/concerns/uneditable_spec.rb"

RSpec.describe Invoice, type: :model do
  subject { FactoryBot.build(:invoice) }

  it { should belong_to :contract }
  it_behaves_like "uneditable"
  it_behaves_like "undestroyable"

  it "calculate total price by contract properties" do
    subject.save!
    expect(subject.total).to(
      be_within(0.001).of(
        subject.contract.theft_coverage - subject.contract.deductible
      )
    )
  end
end
