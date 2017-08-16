require 'rails_helper'

describe 'merchants revenue API' do
  it "response is successful when visiting path" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success
  end
end
