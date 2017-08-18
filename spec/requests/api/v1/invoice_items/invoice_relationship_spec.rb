require 'rails_helper'

describe 'invoice_items api invoice relationship' do
  before(:each) do
    @merchant = create(:merchant)
    @item = create(:item, merchant: @merchant)
    @invoice = create(:invoice)
  end
  it "returns the associated invoice for an invoice_item id" do
    invoice_item = create(:invoice_item, item: @item, invoice: @invoice)
    id = invoice_item.id
    invoice_id = invoice_item.invoice.id

    get "/api/v1/invoice_items/#{id}/invoice"
    
    assert_response :success
    invoice = JSON.parse(response.body)
    expect(invoice['id']).to eq(invoice_id)
  end
end
