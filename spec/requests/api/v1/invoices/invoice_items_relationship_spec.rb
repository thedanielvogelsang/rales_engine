require 'rails_helper'

describe 'invoices api invoice_items relationship' do
  it "returns all associated invoice_items for an invoice id" do
    id = create(:invoice, :with_items).id
    get "/api/v1/invoices/#{id}/invoice_items"
    assert_response :success
  end
end
