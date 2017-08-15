require 'rails_helper'

describe "merchant search API" do
  it "can search and find a single invoice by id" do
    id = create(:invoice).id

    get "/api/v1/invoices/find?id=#{id}"

    expect(response).to be_success

    invoice = JSON.parse(response.body)

    expect(invoice["id"]).to eq(id)
  end
end
