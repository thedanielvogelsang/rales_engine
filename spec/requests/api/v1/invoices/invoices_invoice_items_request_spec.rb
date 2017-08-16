require 'rails_helper'

describe 'Invoice Invoice Items API' do
  it "returns all associated invoice items" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    inv = create(:invoice, merchant: merchant)
    create_list(:invoice_item, 5, invoice: inv, item: item)

    get "/api/v1/invoices/#{inv.id}/invoice_items"

    expect(response).to be_success

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to eq(5)
  end
end
