require 'rails_helper'

describe 'invoices api invoice_items relationship' do
  it 'returns all associated invoice_items for an id' do
    invoice = create(:invoice, :with_items)
    id = invoice.id
    invoice_item = invoice.invoice_items.first
    get "/api/v1/invoices/#{id}/invoice_items"
    
    assert_response :success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
    expect(items.first['id']).to eq(invoice_item.id)
  end
end
