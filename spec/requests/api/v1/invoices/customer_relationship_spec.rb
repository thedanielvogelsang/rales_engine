require 'rails_helper'

describe 'invoices api customer relationship' do
  it "returns the associated customer for an invoice id" do
    invoice = create(:invoice)
    id = invoice.id
    customer_id = invoice.customer.id
    get "/api/v1/invoices/#{id}/customer"
    
    assert_response :success
    customer = JSON.parse(response.body)
    expect(customer['id']).to eq(customer_id)
  end
end
