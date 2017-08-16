require 'rails_helper'

describe 'transaction api invoice relationship' do
  it 'it returns an invoice given a transaction id' do
    id = create(:transaction).id
    transaction = Transaction.last
    invoice_id = transaction.invoice.id
    get "/api/v1/transactions/#{id}/invoice"
    assert_response :success
    invoice = JSON.parse(response.body)
    expect(invoice['id']).to eq(invoice_id)
  end
end
