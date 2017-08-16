require 'rails_helper'

describe 'invoices api items relationship' do
  it "returns all associated items for an invoice id" do
    invoice = create(:invoice, :with_items)
    id = invoice.id
    item = invoice.items.first
    get "/api/v1/invoices/#{id}/items"
    assert_response :success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
    expect(items.first['id']).to eq(item.id)
  end
end
