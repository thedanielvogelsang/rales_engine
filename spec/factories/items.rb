FactoryGirl.define do
  factory :item do
    name "My Item"
    description "MyText"
    unit_price 999
    sequence :merchant_id do |i|
        i
    end
  end
end
