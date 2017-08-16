require 'rails_helper'

describe 'customers api invoice relationship' do
  it "it returns all invoices associated with a customer id" do
    customer = create(:customer, :with_invoices)
    id = customer.id
    invoice_id = customer.invoices.first.id
    invoice_id_3 = customer.invoices.last.id
    get "/api/v1/customers/#{id}/invoices"
    assert_response :success
    invoices = JSON.parse(response.body)
    expect(invoices.first['id']).to eq(invoice_id)
    expect(invoices.last['id']).to eq(invoice_id_3)
  end
end
