require 'rails_helper'

describe 'invoices api transactions relationship' do
  it "returns an associated transaction given an invoice id" do
    id = create(:invoice, :with_transactions).id
    get "/api/v1/invoices/#{id}/transactions"
    assert_response :success
  end
end
