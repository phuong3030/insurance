require 'rails_helper'

RSpec.describe Contract, type: :model do
	it { should belong_to :user }

  describe "Billing Cycles" do
		subject { FactoryBot.build(:contract) }

		it 'has valid a network' do
			Contract::BILLING_CYCLES.each do |type, value|
				subject.billing_cycle = value
				subject.save
				expect(subject.billing_cycle).to eql(type.to_s)
			end
		end
	end
end
