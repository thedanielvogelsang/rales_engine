require 'rails_helper'

describe "Item Most Items" do
  it "returns the top x items ranked by numbers sold" do
    merchant = create(:merchant)
    create_list(:item, 3, merchant: merchant)

    get '/api/v1/items/most_items?quantity=2'

    expect(response).to be_success
  end
end
