require 'rails_helper'

describe "items search 'find_all' API" do
  it "can search and find all items by id" do
    merchant = create(:merchant)
    items = create_list(:item, 3, merchant: merchant)
    id = items.first.id
    get "/api/v1/items/find_all?id=#{id}"

    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item.count).to eq(1)
    expect(item.first["id"]).to eq(id)
  end
  it "can search and find all items by name" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    created_items = create_list(:item, 3, name: "blueberry", merchant: merchant)
    name = created_items.first.name
    different_item = create(:item, merchant: merchant_2)
    expect(Item.count).to eq(4)
    get "/api/v1/items/find_all?name=#{name}"

    assert_response :success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
    expect(items.first['name']).to eq(name)
    # different item test proof?
  end
  it "can search and find all items by description" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    created_items = create_list(:item, 3,
                    description: "lengthy description", merchant: merchant_1)
    description = created_items.first.description
    different_item = create(:item, merchant: merchant_2)
        expect(Item.count).to eq(4)
    get "/api/v1/items/find_all?description=#{description}"

    assert_response :success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
    expect(items.first['description']).to eq(description)
    # different item test proof?
  end
  it "can search and find all items by merchant_id" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    created_items = create_list(:item, 3, merchant: merchant_1)
    id = created_items.first.merchant_id
    different_item = create(:item, merchant: merchant_2)
    expect(Item.count).to eq(4)
    get "/api/v1/items/find_all?merchant_id=#{id}"

    assert_response :success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)

    # different item test proof?
  end
  it "can search and find all items by unit price" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    created_items = create_list(:item, 3, unit_price: 10.00, merchant: merchant_1)
    price = created_items.first.unit_price
    different_item = create(:item, merchant: merchant_2)
    expect(Item.count).to eq(4)
    expect(different_item.unit_price).to_not eq(price)
    get "/api/v1/items/find_all?unit_price=#{price}"

    assert_response :success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
    expect(items.first['unit_price'].to_f).to eq(price)
    # different item test proof?
  end
  it "can search and find all items by created_at" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    created_items = create_list(:item, 3, created_at: "July 10 2010", merchant: merchant_1)
    id1 = created_items.first.id
    id2 = created_items.second.id
    id3 = created_items.last.id
    different_item = create(:item, merchant: merchant_2)
    expect(Item.count).to eq(4)
    get "/api/v1/items/find_all?created_at=july_10_2010"

    assert_response :success
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
    expect(items.first['id']).to eq(id1)
    expect(items.second['id']).to eq(id2)
    expect(items.last['id']).to eq(id3)
    # different item test proof?
  end
  it "can search and find all items by updated_at" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    created_items = create_list(:item, 3, updated_at: "July 20 2020", merchant: merchant_1)
    id1 = created_items.first.id
    id2 = created_items.second.id
    id3 = created_items.last.id
    different_item = create(:item, merchant: merchant_2)
    expect(Item.count).to eq(4)
    get "/api/v1/items/find_all?updated_at=july_20_2020"

    assert_response :success
    items= JSON.parse(response.body)
    expect(items.count).to eq(3)
    expect(items.first['id']).to eq(id1)
    expect(items.second['id']).to eq(id2)
    expect(items.last['id']).to eq(id3)
    # different item test proof?
  end
end
