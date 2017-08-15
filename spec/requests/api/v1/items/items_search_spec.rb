require 'rails_helper'

describe "merchant search API" do
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
    description = create(:item).description
    get "/api/v1/items/find?description=#{description}"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['description']).to eq(description)
  end
  it "can search and find a single item by its merchant_id" do
    description = create(:item).description
    get "/api/v1/items/find?description=#{description}"
    assert_response :success
    item = JSON.parse(response.body)
    expect(item['description']).to eq(description)
  end
end
