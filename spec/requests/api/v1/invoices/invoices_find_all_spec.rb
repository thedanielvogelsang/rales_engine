require 'rails_helper'

describe "invoices search 'find_all' API" do
  it "can search and find all invoices by id" do
    invoices = create_list(:invoice, 3)
    id = invoices.first.id
    get "/api/v1/invoices/find_all?id=#{id}"
    expect(response).to be_success
    invoice = JSON.parse(response.body)
    expect(invoice.count).to eq(1)
    expect(invoice.first["id"]).to eq(id)
  end
  it "can search and find all invoices by customer_id" do
    created_invoices = create_list(:invoice, 3, customer_id: 20)
    id = 20
    different_invoice = create(:invoice)
    expect(Invoice.count).to eq(4)
    get "/api/v1/invoices/find_all?customer_id=#{id}"
    assert_response :success
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
    expect(invoices.first['customer_id']).to eq(id)
    expect(invoices.second['customer_id']).to eq(id)
    expect(invoices.last['customer_id']).to eq(id)
    # different invoice test proof?
  end
  it "can search and find all invoices by merchant_id" do
    created_invoices = create_list(:invoice, 3, merchant_id: 1)
    id = 1
    different_invoice = create(:invoice, merchant_id: 2)
    expect(Invoice.count).to eq(4)
    get "/api/v1/invoices/find_all?merchant_id=#{id}"
    assert_response :success
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
    expect(invoices.first['merchant_id']).to eq(1)
    expect(invoices.second['merchant_id']).to eq(1)
    expect(invoices.last['merchant_id']).to eq(1)
    expect(invoices.first['customer_id']).to_not eq(invoices.last['customer_id'])
    # different invoice test proof?
  end
  it "can search and find all invoices by status" do
    created_invoices = create_list(:invoice, 3)
    different_invoice = create(:invoice, status: "not_shipped")
    expect(Invoice.count).to eq(4)
    expect(different_invoice.status).to_not eq(created_invoices.first.status)
    get "/api/v1/invoices/find_all?status=shipped"
    assert_response :success
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
    expect(invoices.first['status']).to eq('shipped')
    expect(invoices.second['status']).to eq('shipped')
    expect(invoices.last['status']).to eq('shipped')
    expect(invoices.first['status']).to_not eq(different_invoice.status)
  end
  it "can search and find all invoices by created_at" do
    created_invoices = create_list(:invoice, 3, created_at: "July 10 2010")
    id1 = created_invoices.first.id
    id2 = created_invoices.second.id
    id3 = created_invoices.last.id
    different_invoice = create(:invoice)
    expect(Invoice.count).to eq(4)
    get "/api/v1/invoices/find_all?created_at=july_10_2010"
    assert_response :success
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
    expect(invoices.first['id']).to eq(id1)
    expect(invoices.second['id']).to eq(id2)
    expect(invoices.last['id']).to eq(id3)
    # different invoice test proof?
  end
  it "can search and find all invoices by updated_at" do
    created_invoices = create_list(:invoice, 3, updated_at: "July 20 2020")
    id1 = created_invoices.first.id
    id2 = created_invoices.second.id
    id3 = created_invoices.last.id
    different_invoice = create(:invoice)
    expect(Invoice.count).to eq(4)
    get "/api/v1/invoices/find_all?updated_at=july_20_2020"
    assert_response :success
    invoices= JSON.parse(response.body)
    expect(invoices.count).to eq(3)
    expect(invoices.first['id']).to eq(id1)
    expect(invoices.second['id']).to eq(id2)
    expect(invoices.last['id']).to eq(id3)
    # different invoice test proof?
  end
end
