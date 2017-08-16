require 'rails_helper'

describe "invoice_items search 'find_all' API" do
  before(:each) do
    @merchant = create(:merchant)
    @item = create(:item, merchant: @merchant)
    @invoice = create(:invoice)
  end
  it "can search and find all invoice_items by id" do
    items = create_list(:invoice_item, 3, item_id: @item.id, invoice_id: @invoice.id)
    id = items.first.id
    different_item = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id, unit_price: 10.00)
    expect(InvoiceItem.count).to eq(4)
    get "/api/v1/invoice_items/find_all?id=#{id}"
    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item.count).to eq(1)
    expect(invoice_item.first["id"]).to eq(id)
  end
  it "can search and find all invoice_items by item_id" do
    items = create_list(:invoice_item, 3, item_id: @item.id, invoice_id: @invoice.id)
    id = items.first.id
    get "/api/v1/invoice_items/find_all?item_id=#{@item.id}"
    expect(response).to be_success
    invoice_item = JSON.parse(response.body)
    expect(invoice_item.count).to eq(3)
    expect(invoice_item.first["id"]).to eq(id)
  end
  it "can search and find all invoice_items by invoice_id" do
    items = create_list(:invoice_item, 3, item_id: @item.id, invoice_id: @invoice.id)
    id = items.last.id
    expect(InvoiceItem.count).to eq(3)
    get "/api/v1/invoice_items/find_all?invoice_id=#{@invoice.id}"
    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.last["id"]).to eq(id)
  end
  it "can search and find all invoice_items by quantity" do
    create_list(:invoice_item, 3, item_id: @item.id,
                invoice_id: @invoice.id, quantity: 4)
    different_item = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id, unit_price: 10.00)
    expect(InvoiceItem.count).to eq(4)
    get "/api/v1/invoice_items/find_all?quantity=4"
    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.first["quantity"]).to eq(4)
  end
  it "can search and find all invoice_items by unit_price" do
    items = create_list(:invoice_item, 3, item_id: @item.id, invoice_id: @invoice.id)
    price = items.first.unit_price
    different_item = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id, unit_price: 10.00)
    expect(InvoiceItem.count).to eq(4)
    get "/api/v1/invoice_items/find_all?unit_price=#{price}"
    expect(response).to be_success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.first["unit_price"].to_f).to eq(price)
    expect(invoice_items.second["unit_price"].to_f).to eq(price)
    expect(invoice_items.last["unit_price"].to_f).to eq(price)
    expect(different_item.unit_price).to_not eq(price)
  end
  it "can search and find all invoice_items by created_at" do
    items = create_list(:invoice_item, 3, item_id: @item.id,
                invoice_id: @invoice.id,
                created_at: "July 10 2010")
    id = items.last.id
    different_item = create(:invoice_item, item_id: @item.id, invoice_id: @invoice.id)
    expect(InvoiceItem.count).to eq(4)
    get "/api/v1/invoice_items/find_all?created_at=july_10_2010"
    assert_response :success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
    expect(invoice_items.last['id']).to eq(id)
    expect(different_item.created_at).to_not eq("July 10 2010")
    expect(different_item.id).to_not eq(id)
  end
  it "can search and find all invoice_items by updated_at" do
    items = create_list(:invoice_item, 3, item_id: @item.id,
                invoice_id: @invoice.id,
                updated_at: "July 20 2020")
    id = items.first.id
    get "/api/v1/invoice_items/find_all?updated_at=july_20_2020"
    assert_response :success
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.first['id']).to eq(id)
  end
end
