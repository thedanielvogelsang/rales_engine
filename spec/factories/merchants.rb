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

    trait :with_customers do
      after(:create) do |merchant, evaluator|
        id1 = create(:customer).id
        id2 = create(:customer).id
        invoice = create(:invoice, :with_transactions, customer_id: id1, merchant_id: merchant.id)
        invoice2 = create(:invoice, :with_transactions, customer_id: id1, merchant_id: merchant.id)
        invoice3 = create(:invoice, :with_transactions, customer_id: id2, merchant_id: merchant.id)
        invoice4 = create(:invoice, :with_transactions, customer_id: id2, merchant_id: merchant.id)
        failed = create(:transaction, result: 'failed', invoice_id: invoice.id)
        successful = create(:transaction, result: 'success', invoice_id: invoice3.id)
      end
    end
  end
end
