require 'rails_helper'

describe 'Customer search API' do
  it "returns a single customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(id)
  end

  it "returns a single customer by first name" do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find?first_name=#{first_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["first_name"]).to eq(first_name)
  end

  it "returns a single customer by last name " do
    last_name = create(:customer).last_name

    get "/api/v1/customers/find?last_name=#{last_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["last_name"]).to eq(last_name)
  end
end
