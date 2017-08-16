FactoryGirl.define do
  factory :merchant do
    name "MyText"

    trait :with_items do
      transient do
        item_count 3
      end
      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.item_count, merchant: merchant)
      end
    end

    trait :with_invoices do
      transient do
        invoice_count 3
      end
      after(:create) do |merchant, evaluator|
        create_list(:invoice, evaluator.invoice_count, merchant: merchant)
      end
    end
  end
end
