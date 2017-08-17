require 'rails_helper'

describe 'merchants api most revenue by count' do
  before(:each) do
    @customer1 = create(:customer)
    @customer2 = create(:customer)
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    @item1 = create(:item, unit_price: 4000, merchant: @merchant1)
    @item2 = create(:item, unit_price: 2000, merchant: @merchant2)
    @invoice1 = create(:invoice, :with_transactions, customer: @customer1, merchant: @merchant1)
    @invoice2 = create(:invoice, :with_transactions, customer: @customer1, merchant: @merchant2)
    @invoice3 = create(:invoice, :with_transactions, customer: @customer2, merchant: @merchant2)
    @cust_1_invoice_item1 = create(:invoice_item, item: @item1, invoice: @invoice1, quantity: 2)
    @cust_1_invoice_item2 = create(:invoice_item, item: @item2, invoice: @invoice1, quantity: 1)
    @cust_1_invoice_item3 = create(:invoice_item, item: @item1, invoice: @invoice1, quantity: 2)
    @cust_2_invoice_item = create(:invoice_item, item: @item2, invoice: @invoice2, quantity: 1)
  end
  it 'returns correct number of merchants ranked by total revenue' do
    group_size_one = 1
    group_size_two = 2
    get "/api/v1/merchants/most_revenue?quantity=#{group_size_one}"
    assert_response :success
    group1 = JSON.parse(response.body)
    get "/api/v1/merchants/most_revenue?quantity=#{group_size_two}"
    assert_response :success
    group2 = JSON.parse(response.body)
    expect(group1.count).to eq(1)
    expect(group2.count).to eq(2)
  end

  it 'ranks orders them correctly by most_revenue' do
    get "/api/v1/merchants/most_revenue?quantity=2"
    group = JSON.parse(response.body)
    expect(@merchant1.revenue_by_merchant > @merchant2.revenue_by_merchant)
          .to be true
    expect(group.first['id']).to eq(@merchant1.id)
  end
end
