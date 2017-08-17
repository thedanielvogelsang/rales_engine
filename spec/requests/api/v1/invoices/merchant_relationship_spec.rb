require 'rails_helper'

describe 'invoices api merchant relationship' do
  it "returns associated merchant for an invoice id" do
    invoice = create(:invoice)
    id = invoice.id
    merchant_id = invoice.merchant.id

    get "/api/v1/invoices/#{id}/merchant"
    
    assert_response :success
    merchant = JSON.parse(response.body)
    expect(merchant['id']).to eq(merchant_id)
  end
end
