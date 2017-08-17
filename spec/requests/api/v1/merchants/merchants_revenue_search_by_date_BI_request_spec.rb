require 'rails_helper'

describe 'Revenue for Merchant search by date API' do
  it "responds successfully" do
    merchant = create(:merchant, created_at: "June 10 2010")

    get "/api/v1/merchants/#{merchant.id}/revenue?date=June_10_2010"

    expect(response).to be_success
  end
end
