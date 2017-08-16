require 'rails_helper'

describe 'invoice_items/invoice API' do
  it "returns the associated invoice" do
    inv = create(:invoice)
    inv_2 = create(:invoice)
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    inv_item = create(:invoice_item, invoice: inv, item: item)

    get "/api/v1/invoice_items/#{inv_item.id}/invoice"

    expect(response).to be_success

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(inv.id)
    expect(invoice["id"]).to_not eq(inv_2)
  end
end
