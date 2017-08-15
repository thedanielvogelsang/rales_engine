require 'rails_helper'

describe 'invoices api' do
  it 'sends a list of invoices' do
    create_list(:invoice, 6)
    get '/api/v1/invoices'
    assert_response :success
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(6)
  end

  it 'returns an invoice by its id' do
    id = create(:invoice).id
    get "/api/v1/invoices/#{id}"
    assert_response :success
    invoice = JSON.parse(response.body)
    expect(invoice['id']).to eq(id)
  end
end
