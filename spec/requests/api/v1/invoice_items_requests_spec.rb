require 'rails_helper'

describe 'invoice_items api' do
  before(:each) do
    @merchant = create(:merchant)
    @item = create(:item, merchant: @merchant)
    @invoice = create(:invoice)
  end
  it 'sends a list of invoice_items' do
    create_list(:invoice_item, 3, item_id: @item.id, invoice_id: @invoice.id)
    get '/api/v1/invoice_items'

    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
  end

  it 'returns an invoice item for its id' do
    id = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id).id
    get "/api/v1/invoice_items/#{id}"
    
    assert_response :success
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(id)
  end
end
