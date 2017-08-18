require 'rails_helper'

describe "items search 'find' API" do
  it "can search and find a single item by id" do
    merchant = create(:merchant)
    id = create(:item, merchant: merchant).id
    get "/api/v1/items/find?id=#{id}"

    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(id)
  end

  it "can search and find a single item by its name" do
    merchant = create(:merchant)
    name = create(:item, merchant: merchant).name
    get "/api/v1/items/find?name=#{name}"

    assert_response :success
    item = JSON.parse(response.body)
    expect(item['name']).to eq(name)
  end

  it "can search and find a single item by its description" do
    merchant = create(:merchant)
    description = create(:item, merchant: merchant).description
    get "/api/v1/items/find?description=#{description}"

    assert_response :success
    item = JSON.parse(response.body)
    expect(item['description']).to eq(description)
  end

  it "can search and find a single item by its unit price" do
    merchant = create(:merchant)
    price = create(:item, merchant: merchant).unit_price
    get "/api/v1/items/find?unit_price=#{price}"

    assert_response :success
    item = JSON.parse(response.body)
    expect(item['unit_price']).to eq(price)
  end

  it "can search and find a single item by its merchant_id" do
    created_merchant = create(:merchant)
    merchant = create(:item, merchant: created_merchant).merchant_id
    get "/api/v1/items/find?merchant_id=#{merchant}"

    assert_response :success
    item = JSON.parse(response.body)
    expect(item['merchant_id']).to eq(merchant)
  end

  it "can search and find a single item by its created_at" do
    merchant = create(:merchant)
    id = create(:item, created_at: "July 10 2010", merchant: merchant).id
    get "/api/v1/items/find?created_at=july_10_2010"

    assert_response :success
    item = JSON.parse(response.body)
    expect(item['id']).to eq(id)
  end

  it "can search and find a single item by its updated_at" do
    merchant = create(:merchant)
    id = create(:item, updated_at: "July 20 2020", merchant: merchant).id
    get "/api/v1/items/find?updated_at=july_20_2020"

    assert_response :success
    item = JSON.parse(response.body)
    expect(item['id']).to eq(id)
  end

end
