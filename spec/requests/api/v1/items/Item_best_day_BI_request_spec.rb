require 'rails_helper'

describe 'Item Best Day API' do
  it "returns the best day of sales for an item" do
    create(:customer)
    merch_1, merch_2, merch_3 = create_list(:merchant, 3)
    item_1 = create(:item, merchant: merch_1)
    inv_1 = create(:invoice, merchant: merch_1, created_at: "July 10 2010")
    inv_2 = create(:invoice, merchant: merch_2, created_at: "June 1 2015")
    inv_3 = create(:invoice, merchant: merch_3, created_at: "June 1 2015")
    trans_1 = create(:transaction, invoice: inv_1, result: "success")
    trans_2 = create(:transaction, invoice: inv_2, result: "success")
    trans_3 = create(:transaction, invoice: inv_3, result: "success")
    ii_1 = create(:invoice_item,
                    item: item_1,
                    invoice: inv_1,
                    quantity: 1 )
    ii_2 = create(:invoice_item,
                    item: item_1,
                    invoice: inv_2,
                    quantity: 2 )
    ii_3 = create(:invoice_item,
                    item: item_1,
                    invoice: inv_3,
                    quantity: 3 )

    get "/api/v1/items/#{item_1.id}/best_day"

    expect(response).to be_success

    best_day = JSON.parse(response.body)

    expect(best_day["best_day"]).to eq("2015-06-01T00:00:00.000Z")
  end
end
