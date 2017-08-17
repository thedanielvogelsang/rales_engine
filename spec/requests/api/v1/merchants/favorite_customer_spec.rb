require 'rails_helper'

describe 'merchants api favorite_customer' do
  it "returns most frequent customer given id" do
    id = create(:merchant, :with_customers).id
    customers = Merchant.find(id).customers
    #testing factory girl relationships
    expect(customers.count).to eq(2)
    expect(Invoice.count).to eq(4)
    expect(Transaction.not_successful.count).to eq(1)
    expect(Transaction.not_successful.first.invoice.customer_id).to eq(customers.first.id)
    customer_1_successfuls = Customer.first
                            .invoices.joins(:transactions)
                            .merge(Transaction.successful)
    customer_2_successfuls = Customer.second
                            .invoices.joins(:transactions)
                            .merge(Transaction.successful)
    expect(customer_1_successfuls.count).to eq(6)
    expect(customer_2_successfuls.count).to eq(7)

    get "/api/v1/merchants/#{id}/favorite_customer"
    assert_response :success
    customer = JSON.parse(response.body)
    expect(customer['id']).to eq(Customer.second.id)
  end
end
