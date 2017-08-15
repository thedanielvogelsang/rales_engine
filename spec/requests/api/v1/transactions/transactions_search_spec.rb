require 'rails_helper'

describe 'transaction search API' do
  it "can search and find a single transaction by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/find?id=#{id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(id)
  end
end
