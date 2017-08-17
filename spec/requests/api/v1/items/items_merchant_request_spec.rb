require 'rails_helper'

describe 'items merchant API' do
  it "returns the associated merchant for the item" do
    created_merchant = create(:merchant)
    item = create(:item, merchant: created_merchant)
    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_success
    merchant = JSON.parse(response.body)
    expect(merchant["id"]).to eq(created_merchant.id)
  end
end
