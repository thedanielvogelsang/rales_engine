require 'rails_helper'

describe 'Customer search API' do
  it "returns a single customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer["id"]).to eq(id)

  end
end
