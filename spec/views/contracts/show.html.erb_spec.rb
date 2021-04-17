require 'rails_helper'

RSpec.describe "contracts/show", type: :view do
  before(:each) do
    user = User.create!

    @contract = assign(:contract, Contract.create!(
      theft_coverage: "9.99",
      deductible: "9.99",
      user_id: user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
