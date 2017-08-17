require 'rails_helper'

describe 'merchants api customers pending invoices relationship' do
  it "returns associated customers with pending invoices" do
    merchant = create(:merchant)
    id = merchant.id
    customer = create(:customer)
    invoice = create(:invoice, status: 'pending', merchant_id: merchant.id, customer_id: customer.id)
    get "/api/v1/merchants/#{id}/customers_with_pending_invoices"
    expect(response).to be_success
    customer = JSON.parse(response.body)
  end
end
