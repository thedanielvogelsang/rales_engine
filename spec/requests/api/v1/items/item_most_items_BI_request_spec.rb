require 'rails_helper'

describe "Item Most Items" do
  it "returns the top x items ranked by numbers sold" do
    create(:customer)
    merch_1, merch_2, merch_3 = create_list(:merchant, 3)
    item_1 = create(:item, merchant: merch_1)
    item_2 = create(:item, merchant: merch_2)
    item_3 = create(:item, merchant: merch_3)
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
                    item: item_2,
                    invoice: inv_2,
                    quantity: 2 )
    ii_3 = create(:invoice_item,
                    item: item_3,
                    invoice: inv_3,
                    quantity: 3 )

    get '/api/v1/items/most_items?quantity=2'

    expect(response).to be_success
    most_items = JSON.parse(response.body)
    expect(most_items.count).to eq(2)
    expect(most_items.count).to_not eq(3)
  end
end
