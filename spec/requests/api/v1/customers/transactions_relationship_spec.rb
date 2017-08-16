require 'rails_helper'

describe 'customers api transaction relationship' do
  it "it returns all transactions associated with a customer id" do
    customer = create(:customer, :with_transactions)
    id = customer.id
    transactions = customer.invoices.map{|invoice| invoice.transactions}
    trans_count = transactions.flatten.count
    transaction_id = transactions.first.first.id
    transaction_id_3 = transactions.last.last.id
    get "/api/v1/customers/#{id}/transactions"
    assert_response :success
    returned_transactions = JSON.parse(response.body)
    expect(returned_transactions.count).to eq(3)
    expect(returned_transactions.first['id']).to eq(transaction_id)
    expect(returned_transactions.last['id']).to eq(transaction_id_3)
  end
end
