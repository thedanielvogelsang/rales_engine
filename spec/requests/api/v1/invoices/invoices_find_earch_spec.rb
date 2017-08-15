require 'rails_helper'

describe "merchant search API" do
  it "can search and find a single invoice by id" do
    id = create(:invoice).id
    get "/api/v1/invoices/find?id=#{id}"
    expect(response).to be_success
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(id)
  end
  it "can search and find a single invoice by its customer_id" do
    customer = create(:invoice).customer_id
    get "/api/v1/invoices/find?customer_id=#{customer}"
    assert_response :success
    invoice = JSON.parse(response.body)
    expect(invoice['customer_id']).to eq(customer)
  end
  it "can search and find a single invoice by its merchant_id" do
    merchant = create(:invoice).merchant_id
    get "/api/v1/invoices/find?merchant_id=#{merchant}"
    assert_response :success
    invoice = JSON.parse(response.body)
    expect(invoice['merchant_id']).to eq(merchant)
  end
  it "can search and find a single invoice by its status" do
    status = create(:invoice).status
    get "/api/v1/invoices/find?status=#{status}"
    assert_response :success
    invoice = JSON.parse(response.body)
    expect(invoice['status']).to eq(status)
  end
  it "can search and find a single invoice by its created_at" do
    id = create(:invoice, created_at: "July 10 2010").id
    get "/api/v1/invoices/find?created_at=july_10_2010"
    assert_response :success
    invoice = JSON.parse(response.body)
    expect(invoice['id']).to eq(id)
  end
  it "can search and find a single invoice by its updated_at" do
    id = create(:invoice, updated_at: "July 20 2020").id
    get "/api/v1/invoices/find?updated_at=july_20_2020"
    assert_response :success
    invoice = JSON.parse(response.body)
    expect(invoice['id']).to eq(id)
  end
end
