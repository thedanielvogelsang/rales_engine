require 'rails_helper'

describe "items search 'find' API" do
  it "can search and find a single item by id" do
    id = create(:item).id
    get "/api/v1/items/find?id=#{id}"
    expect(response).to be_success
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(id)
  end

  it "can search and find a single item by its name" do
    name = create(:item).name
    get "/api/v1/items/find?name=#{name}"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['name']).to eq(name)
  end

  it "can search and find a single item by its description" do
    description = create(:item).description
    get "/api/v1/items/find?description=#{description}"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['description']).to eq(description)
  end

  it "can search and find a single item by its unit price" do
    price = create(:item).unit_price
    get "/api/v1/items/find?unit_price=#{price}"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['unit_price'].to_f).to eq(price)
  end

  it "can search and find a single item by its merchant_id" do
    merchant = create(:item).merchant_id
    get "/api/v1/items/find?merchant_id=#{merchant}"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['merchant_id']).to eq(merchant)
  end

  it "can search and find a single item by its created_at" do
    id = create(:item, created_at: "July 10 2010").id
    get "/api/v1/items/find?created_at=july_10_2010"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['id']).to eq(id)
  end

  it "can search and find a single item by its updated_at" do
    id = create(:item, updated_at: "July 20 2020").id
    get "/api/v1/items/find?updated_at=july_20_2020"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['id']).to eq(id)
  end

end
