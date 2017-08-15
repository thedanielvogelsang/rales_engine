require 'rails_helper'

describe 'items api' do
  it 'returns a list of items' do
    create_list(:item, 6)
    get '/api/v1/items'
    expect(response).to be_success
    items = JSON.parse(response.body)
    expect(items.count).to eq(6)
  end

  it 'returns an item from its id' do
    id = create(:item).id
    get "/api/v1/items/#{id}"
    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(id)
  end
end
