require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context 'validations' do
    it{should have_many(:items)}
    it{should have_many(:customers)}
    it{should have_many(:invoices)}
  end
end
