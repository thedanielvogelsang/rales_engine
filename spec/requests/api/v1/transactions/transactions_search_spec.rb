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
end
