require 'rails_helper'

describe "invoice transactions api" do
  it 'returns all transactions associated with an invoice' do
    invoice = create(:invoice)
    create_list(:transaction, 5, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.count).to be(5)
  end
end
