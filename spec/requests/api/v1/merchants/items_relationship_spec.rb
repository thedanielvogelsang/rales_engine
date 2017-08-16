require 'rails_helper'

describe 'merchants api items relationship' do
  it 'returns a list of related invoices given an id' do
    id = create(:merchant, :with_items).id
    get "/api/v1/merchants/#{id}/items"
    assert_response :success
    items = JSON.parse(response.body)
    expect(items.first['merchant_id']).to eq(id)
  end
end
