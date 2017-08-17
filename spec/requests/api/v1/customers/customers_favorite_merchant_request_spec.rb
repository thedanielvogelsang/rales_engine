require 'rails_helper'

describe "Customer's Favorite Merchant API" do
  it "returns the merchant wher the customer has most transactions" do
    customer = create(:customer)

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_success

  end
end
