require 'rails_helper'

describe 'invoices api merchant relationship' do
  it "returns associated merchant for an invoice id" do
    id = create(:invoice).id
    get "/api/v1/invoices/#{id}/merchant"
    assert_response :success
  end
end
