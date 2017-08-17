require 'rails_helper'

describe 'Revenue for Merchant search by date API' do
  it "responds successfully" do
    create(:customer)
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)
    item_3 = create(:item, merchant: merchant)
    inv_1 = create(:invoice, merchant: merchant, created_at: "July 10 2010")
    inv_2 = create(:invoice, merchant: merchant, created_at: "June 1 2015")
    inv_3 = create(:invoice, merchant: merchant, created_at: "June 1 2015")
    trans_1 = create(:transaction, invoice: inv_1, result: "success")
    trans_2 = create(:transaction, invoice: inv_2, result: "success")
    trans_3 = create(:transaction, invoice: inv_3, result: "success")
    ii_1 = create(:invoice_item,
                    item: item_1,
                    invoice: inv_1,
                    quantity: 1,
                    unit_price: 100 )
    ii_2 = create(:invoice_item,
                    item: item_2,
                    invoice: inv_2,
                    quantity: 2,
                    unit_price: 100 )
    ii_3 = create(:invoice_item,
                    item: item_3,
                    invoice: inv_3,
                    quantity: 3,
                    unit_price: 100 )

    get "/api/v1/merchants/#{merchant.id}/revenue?date=July_10_2010"

    expect(response).to be_success
    revenue = JSON.parse(response.body)
    expect(revenue["revenue"]).to eq("1.00")
    expect(revenue["revenue"]).to_not eq("5.00")
  end
end
