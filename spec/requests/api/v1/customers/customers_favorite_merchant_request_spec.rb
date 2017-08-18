require 'rails_helper'

describe "Customer's Favorite Merchant API" do
  it "returns the merchant wher the customer has most transactions" do
    customer = create(:customer)
    merch_1, merch_2 = create_list(:merchant, 2)
    item_1 = create(:item, merchant: merch_1)
    item_2 = create(:item, merchant: merch_2)
    item_3 = create(:item, merchant: merch_2)
    inv_1 = create(:invoice, merchant: merch_1, customer: customer)
    inv_2 = create(:invoice, merchant: merch_2, customer: customer)
    inv_3 = create(:invoice, merchant: merch_2, customer: customer)
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

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_success
    favorite_merchant = JSON.parse(response.body)
    expect(favorite_merchant["id"]).to eq(merch_2.id)
    expect(favorite_merchant["id"]).to_not eq(merch_1.id)

  end
end
