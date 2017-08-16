require 'rails_helper'

describe 'invoice_items api item relationship' do
  before(:each) do
    @merchant = create(:merchant)
    @item = create(:item, merchant: @merchant)
    @invoice = create(:invoice)
  end
  it "returns the associated item for an invoice_item id" do
    invoice_item = create(:invoice_item, item: @item, invoice: @invoice)
    id = invoice_item.id
    item_id = invoice_item.item.id
    get "/api/v1/invoice_items/#{id}/item"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['id']).to eq(item_id)
  end
end
