require 'rails_helper'

describe 'Item Best Day API' do
  it "returns the best day of sales for an item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)

    get "/api/v1/items/#{item.id}/best_day"

    expect(response).to be_success
  end
end
