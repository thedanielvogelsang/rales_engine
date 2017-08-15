require 'rails_helper'

describe 'item random api' do
  it 'returns a random item from list of items' do
    merchant = create(:merchant)
    items = create_list(:item, 3, merchant: merchant)
    item_ids = items.map{|item| item.id}
    get "/api/v1/items/random"
    assert_response :success
    return_items = JSON.parse(response.body)
    expect(item_ids).to include(return_items.first['id'])
  end
end
