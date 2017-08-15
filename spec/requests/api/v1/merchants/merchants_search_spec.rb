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

    expect(merchant["id"]).to eq(created_merchant.id)
  end

  it "can find a merchant by updated at" do
    updated_merchant = create(:merchant, updated_at: "July 19 2010")

    get "/api/v1/merchants/find?updated_at=july_19_2010"

    expect(response).to be_success
    merchant = JSON.parse(response.body)

    expect(merchant["id"]).to eq(updated_merchant.id)
  end

  it "can find a merchant by id via multi-finder" do
    id = create(:merchant).id

    get "/api/v1/merchants/find_all?id=#{id}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant.first["id"]).to eq(id)
  end

  it "can find merchants by name" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)

    get "/api/v1/merchants/find_all?name=#{merchant1.name}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)

    expect(merchant.first["name"]).to eq(merchant1.name)
    expect(merchant.last["name"]).to eq(merchant3.name)
    expect(merchant.count).to eq(3)
  end

  it "can find merchants by created_at" do
    merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3, created_at: "July 19 2010")

    get '/api/v1/merchants/find_all?created_at=july_19_2010'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end

  it "can find merchants by updated_at" do
    merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3, updated_at: "July 29 2010")

    get '/api/v1/merchants/find_all?updated_at=july_29_2010'

    expect(response).to be_success

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end
end
