require 'rails_helper'

RSpec.describe "contracts/edit", type: :view do
  before(:each) do
    user = User.create!

    @contract = assign(:contract, Contract.create!(
      theft_coverage: "9.99",
      deductible: "9.99",
      user_id: user.id
    ))
  end

  it "renders the edit contract form" do
    render

    assert_select "form[action=?][method=?]", contract_path(@contract), "post" do

      assert_select "input[name=?]", "contract[theft_coverage]"

      assert_select "input[name=?]", "contract[deductible]"
    end
  end
end
