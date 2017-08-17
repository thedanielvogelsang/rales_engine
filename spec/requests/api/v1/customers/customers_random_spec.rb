require 'rails_helper'

describe "Customers random API" do
  it "returns random customer" do
    create_list(:customer, 2)
    get '/api/v1/customers/random'

    expect(response).to be_success
    customer = JSON.parse(response.body)
    expect(customer.count).to eq(1)
  end
end
