FactoryGirl.define do
  factory :invoice_item do
    item nil
    invoice nil
    quantity 2
    unit_price "9.99"
  end
end
