require 'rails_helper'

describe "merchant search API" do
  before(:each) do
    @item = create(:item)
    @invoice = create(:invoice)
  end
  it "can search and find a single invoice_item by id" do
    id = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id).id

    get "/api/v1/invoice_items/find?id=#{id}"

    expect(response).to be_success

    invoice_item = JSON.parse(response.body)

    expect(invoice_item["id"]).to eq(id)
  end
end
