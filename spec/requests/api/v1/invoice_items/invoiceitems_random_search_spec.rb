require 'rails_helper'

describe 'invoice_item random api' do
  before(:each) do
    @merchant = create(:merchant)
    @item = create(:item, merchant: @merchant)
    @invoice = create(:invoice)
  end
  it 'returns a random invoice_items from invoice_items db' do
    invoice_items = create_list(:invoice_item, 3, item_id: @item.id, invoice_id: @invoice.id)
    invoice_item_ids = invoice_items.map{|item| item.id}
    get "/api/v1/invoice_items/random"
    
    assert_response :success
    return_items = JSON.parse(response.body)
    expect(invoice_item_ids).to include(return_items.first['id'])
  end
end
