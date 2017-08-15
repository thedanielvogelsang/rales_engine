require 'rails_helper'

describe "merchant search API" do
  it "can search and find a single merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/find?id=#{id}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(id)
  end

  it "can find a merchant by name" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant["name"]).to eq(name)
  end

  it "can find a merchant by created at" do
    created_merchant = create(:merchant, created_at: "July 19 2009")

    get "/api/v1/merchants/find?created_at=july_19_2009"

    expect(response).to be_success
    merchant = JSON.parse(response.body)
byebug
    expect(merchant["id"]).to eq(created_merchant.id)
  end

  it "can find a merchant by updated at" do
    updated_merchant = create(:merchant, updated_at: "July 19 2010")

    get "/api/v1/merchants/find?updated_at=july_19_2010"

    expect(response).to be_success
    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(updated_merchant.id)
  end
end
