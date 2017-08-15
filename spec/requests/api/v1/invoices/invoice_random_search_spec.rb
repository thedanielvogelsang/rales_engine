require 'rails_helper'

describe 'invoice random api' do
  it 'returns a random invoice from invoices db' do
    invoices = create_list(:invoice, 3)
    invoice_ids = invoices.map{|item| item.id}
    get "/api/v1/invoices/random"
    assert_response :success
    return_invoices = JSON.parse(response.body)
    expect(invoice_ids).to include(return_invoices.first['id'])
  end
end
