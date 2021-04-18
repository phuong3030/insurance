require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { should belong_to :user }
  it { should have_many :properties }
  subject { FactoryBot.build(:contract) }

  describe "Billing Cycles" do
    it 'has valid a network' do
      Contract::BILLING_CYCLES.each do |type, value|
        subject.billing_cycle = value
        subject.save
        expect(subject.billing_cycle).to eql(type.to_s)
      end
    end
  end

  context "yearly premium" do
    it "calculate by properties" do
      expect(subject.yearly_premium).to(
        be_within(0.001).of(
          subject.properties.inject(0.0) { |acc, cur| acc + cur.value }
        )
      )
    end
  end
end
