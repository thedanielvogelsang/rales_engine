require 'rails_helper'

describe 'transaction search API' do
  it "can search and find a single transaction by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/find?id=#{id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(id)
  end

  it "can find a single transaction by invoice id" do
    invoice_id = create(:transaction).invoice_id

    get "/api/v1/transactions/find?invoice_id=#{invoice_id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["invoice_id"]).to eq(invoice_id)
  end

  it "can find a single transaction by credit card #" do
    cc = create(:transaction).credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{cc}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["credit_card_number"]).to eq(cc)
  end

  it "can find a single transaction by credit card expiration date" do
    created_trans = create(:transaction, credit_card_expiration_date: "July 10 2020")

    get "/api/v1/transactions/find?credit_card_expiration_date=July_10_2020"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(created_trans.id)
  end

  it "can find a single transaction by result" do
    result = create(:transaction).result

    get "/api/v1/transactions/find?credit_card_number=#{result}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["result"]).to eq(result)
  end

  it "can find a single transaction by created at" do
    created_trans = create(:transaction, created_at: "July 10 2001")

    get "/api/v1/transactions/find?created_at=July_10_2001"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(created_trans.id)
  end

  it "can find a single transaction by updated at" do
    created_trans = create(:transaction, updated_at: "June 10 2001")

    get "/api/v1/transactions/find?updated_at=June_10_2001"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction["id"]).to eq(created_trans.id)
  end

  # Find all

  it "can find_all a transaction by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/find_all?id=#{id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)

    expect(transaction.first["id"]).to eq(id)
  end

  it "can find multiple transactions by invoice_id" do
    invoice = create(:invoice)
    trans = create_list(:transaction, 3, invoice: invoice)
    trans_4 = create(:transaction)

    get "/api/v1/transactions/find_all?invoice_id=#{trans.first.invoice_id}"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can find multiple transactions by credit card #" do
    trans_1, trans_2, trans_3 = create_list(:transaction, 3, credit_card_number: "12345")
    trans_4 = create(:transaction, credit_card_number: "122")

    get "/api/v1/transactions/find_all?credit_card_number=#{trans_1.credit_card_number}"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can find multiple transactions by credit card expiration date" do
    trans_1, trans_2, trans_3 = create_list(:transaction, 3, credit_card_expiration_date: "July 10 2020")
    trans_4 = create(:transaction, credit_card_expiration_date: "December 1 1991")

    get "/api/v1/transactions/find_all?credit_card_expiration_date=July_10_2020"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can find multiple transactions by result" do
    trans_1, trans_2, trans_3 = create_list(:transaction, 3, result: "success")
    trans_4 = create(:transaction, result: "failure")

    get "/api/v1/transactions/find_all?result=#{trans_1.result}"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can find multiple transactions by created at" do
    trans_1, trans_2, trans_3 = create_list(:transaction, 3, created_at: "July 10 2020")
    trans_4 = create(:transaction, created_at: "December 1 1991")

    get "/api/v1/transactions/find_all?created_at=July_10_2020"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end

  it "can find multiple transactions by updated at" do
    trans_1, trans_2, trans_3 = create_list(:transaction, 3, updated_at: "July 10 2020")
    trans_4 = create(:transaction, updated_at: "December 1 1991")

    get "/api/v1/transactions/find_all?updated_at=July_10_2020"

    expect(response).to be_success

    transactions = JSON.parse(response.body)

    expect(transactions.count).to eq(3)
  end
end
