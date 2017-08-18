require 'rails_helper'

describe 'Item Invoice Items API' do
  it "Returns all invoice_items associated with item" do
    inv = create(:invoice)
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    create_list(:invoice_item, 3, invoice: inv, item: item)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
  end
end
