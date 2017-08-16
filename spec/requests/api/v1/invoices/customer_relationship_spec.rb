require 'rails_helper'

describe 'invoices api customer relationship' do
  it "returns the associated customer for an invoice id" do
    id = create(:invoice).id
    byebug
    get "/api/v1/invoices/#{id}/customer"
    assert_response :success
  end
end
