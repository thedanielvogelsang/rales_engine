require 'rails_helper'

describe 'Customer API' do
  it "returns all customers" do
    create_list(:customer, 4)

    get '/api/v1/customers'

    expect(response).to be_success

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(4)
  end

  it "returns a customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(id)

  end
end
