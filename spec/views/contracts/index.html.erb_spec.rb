require 'rails_helper'

RSpec.describe "contracts/index", type: :view do
  before(:each) do
    user = User.create!

    assign(:contracts, [
      Contract.create!(
        theft_coverage: "9.99",
        deductible: "9.99",
        user_id: user.id
      ),
      Contract.create!(
        theft_coverage: "9.99",
        deductible: "9.99",
        user_id: user.id
      )
    ])
  end

  it "renders a list of contracts" do
    render
    assert_select "tr>td", text: "9.99".to_s, count: 4
  end
end
