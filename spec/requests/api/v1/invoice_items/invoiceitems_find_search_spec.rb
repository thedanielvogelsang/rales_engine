require 'rails_helper'

describe "invoice_items search 'find' API" do
  before(:each) do
    @merchant = create(:merchant)
    @item = create(:item, merchant: @merchant)
    @invoice = create(:invoice)
  end
  it "can search and find a single invoice_item by id" do
    id = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id).id

    get "/api/v1/invoice_items/find?id=#{id}"

    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(id)
  end
  it "can search and find a single invoice_item by item_id" do
    id = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id).id

    get "/api/v1/invoice_items/find?item_id=#{@item.id}"

    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(id)
  end
  it "can search and find a single invoice_item by invoice_id" do
    id = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id).id

    get "/api/v1/invoice_items/find?invoice_id=#{@invoice.id}"

    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(id)
  end
  it "can search and find a single invoice_item by quantity" do
    create(:invoice_item, item_id: @item.id,
                invoice_id: @invoice.id, quantity: 4)

    get "/api/v1/invoice_items/find?quantity=4"

    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["quantity"]).to eq(4)
  end
  it "can search and find a single invoice_item by unit_price" do
    price = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id).unit_price
    get "/api/v1/invoice_items/find?unit_price=#{price}"

    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["unit_price"].to_f).to eq(price)
  end
  it "can search and find a single invoice_item by its created_at" do
    id = create(:invoice_item, item_id: @item.id,
                invoice_id: @invoice.id,
                created_at: "July 10 2010").id
    get "/api/v1/invoice_items/find?created_at=july_10_2010"

    assert_response :success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item['id']).to eq(id)
  end
  it "can search and find a single invoice_item by its updated_at" do
    id = create(:invoice_item, item_id: @item.id,
                invoice_id: @invoice.id,
                updated_at: "July 20 2020").id
    get "/api/v1/invoice_items/find?updated_at=july_20_2020"
    
    assert_response :success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item['id']).to eq(id)
  end
end
