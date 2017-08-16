require 'rails_helper'

describe 'merchants api invoices relationship' do
  it 'returns a list of related invoices given an id' do
    id = create(:merchant, :with_invoices).id
    get "/api/v1/merchants/#{id}/invoices"
    assert_response :success
    invoices = JSON.parse(response.body)
    expect(invoices.first['merchant_id']).to eq(id)
  end
end
