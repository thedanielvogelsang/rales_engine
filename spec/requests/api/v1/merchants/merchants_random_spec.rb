require 'rails_helper'

describe 'Merchant random API' do
  it "returns a random merchant" do
    merchant_1, merchant_2 = create_list(:merchant, 2)

    get '/api/v1/merchants/random'

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant.first["id"]).to eq(merchant_1.id).or eq(merchant_2.id)
  end
end
