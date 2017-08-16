FactoryGirl.define do
  factory :invoice do
    customer
    merchant
    status "shipped"
    trait :with_items do
      transient do
        item_count 3
      end
      after(:create) do |invoice, evaluator|
        merchant = create(:merchant)
        create_list(:item, evaluator.item_count, merchant: merchant)
        item = Item.last
        create_list(:invoice_item, evaluator.item_count, invoice: invoice, item: item)
      end
    end
    trait :with_transactions do
      transient do
        transaction_count 3
      end
      after(:create) do |invoice, evaluator|
        create_list(:transaction, evaluator.transaction_count, invoice: invoice)
      end
    end
  end
end
