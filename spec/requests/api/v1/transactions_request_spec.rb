require 'rails_helper'

describe "transaction API" do
  it 'sends a list of transactions' do
    create_list(:transaction, 3)

    get '/api/v1/transactions'

    assert_response :success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end
end
