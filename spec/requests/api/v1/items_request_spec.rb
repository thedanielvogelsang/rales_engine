require 'rails_helper'

describe 'items api' do
  it 'returns a list of items' do
    merchant = create(:merchant)
    create_list(:item, 6, merchant: merchant)
    get '/api/v1/items'
    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(6)
  end

  it 'returns an item from its id' do
    merchant = create(:merchant)
    id = create(:item, merchant: merchant).id
    get "/api/v1/items/#{id}"
    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(id)
  end
end
