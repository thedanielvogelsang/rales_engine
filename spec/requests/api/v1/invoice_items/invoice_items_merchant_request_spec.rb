require 'rails_helper'

describe "Invoite Items Item API" do
  it "returns associated Item for invoice item" do
    inv = create(:invoice)
    inv_2 = create(:invoice)
    merchant = create(:merchant)
    item_created = create(:item, merchant: merchant)
    inv_item = create(:invoice_item, invoice: inv, item: item_created)

    get "/api/v1/invoice_items/#{inv_item.id}/item"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item["id"]).to eq(item_created.id)
  end
end
