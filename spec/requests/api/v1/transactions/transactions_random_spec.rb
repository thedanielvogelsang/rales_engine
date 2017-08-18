require 'rails_helper'

describe "Transactions random API" do
  it "returns random transaction" do
    trans_1, trans_2 = create_list(:transaction, 2)
    get '/api/v1/transactions/random'
    
    expect(response).to be_success
    transaction = JSON.parse(response.body)
    expect(transaction.count).to eq(1)
  end
end
