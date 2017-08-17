require 'rails_helper'

describe 'merchants api total revenue by date' do
  before(:each) do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant)
    merchant_1_item = create(:item, merchant: @merchant1, unit_price: 1000)
    merchant_2_item = create(:item, merchant: @merchant2, unit_price: 2000)
    @date = "2012-03-16 11:55:05"
    invoice1 = create(:invoice, :with_transactions, merchant: @merchant1, created_at: @date)
    invoice2 = create(:invoice, :with_transactions, merchant: @merchant2, created_at: @date)
    invoice3_not_same_day = create(:invoice, merchant: @merchant2)
    invoice_item = create(:invoice_item, item: merchant_1_item, invoice: invoice1, quantity: 1, unit_price: merchant_1_item.unit_price)
    invoice_item2 = create(:invoice_item, item: merchant_2_item, invoice: invoice2, quantity: 1, unit_price: merchant_2_item.unit_price)
  end
  it 'returns total revenue given date param' do
    expect(@merchant1.revenue_by_date(@date).to_i > @merchant2.revenue_by_date(@date).to_i).to be false
    get "/api/v1/merchants/revenue?date=#{@date}"
    merchants = JSON.parse(response.body)
    expect(merchants['total_revenue']).to eq("30.00")
  end
end
