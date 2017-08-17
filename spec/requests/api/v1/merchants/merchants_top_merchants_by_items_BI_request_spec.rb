require 'rails_helper'

describe 'Merchants by Total Items Sold API' do
  it 'returns successful reponse' do
    create_list(:merchant, 2)

    get "/api/v1/merchants/most_items?quantity=2"

    expect(response).to be_success
  end
end
