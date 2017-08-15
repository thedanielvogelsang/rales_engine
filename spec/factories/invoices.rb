FactoryGirl.define do
  factory :invoice do
    sequence :customer_id do |i|
        i
      end
    sequence :merchant_id, [20, 23, 26, 29].cycle do |i|
        i
      end
    status "shipped"
  end
end
