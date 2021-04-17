require 'rails_helper'

RSpec.describe "contracts/new", type: :view do
  before(:each) do
    user = User.create!

    assign(:contract, Contract.new(
      theft_coverage: "9.99",
      deductible: "9.99",
      user_id: user.id
    ))
  end

  it "renders new contract form" do
    render

    assert_select "form[action=?][method=?]", contracts_path, "post" do

      assert_select "input[name=?]", "contract[theft_coverage]"

      assert_select "input[name=?]", "contract[deductible]"
    end
  end
end
