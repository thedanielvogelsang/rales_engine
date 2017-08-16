require 'rails_helper'

describe 'invoices api transactions relationship' do
  it "returns an associated transaction given an invoice id" do
    invoice = create(:invoice, :with_transactions)
    id = invoice.id
    transaction = invoice.transactions.first
    get "/api/v1/invoices/#{id}/transactions"
    assert_response :success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(3)
    expect(transactions.first['id']).to eq(transaction.id)
  end
end
