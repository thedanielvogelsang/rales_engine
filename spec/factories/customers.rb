FactoryGirl.define do
  factory :customer do
    first_name "MyString"
    last_name "MyString"
    trait :with_invoices do
      transient do
        invoice_count 3
      end
      after(:create) do |customer, evaluator|
        create_list(:invoice, evaluator.invoice_count, customer: customer)
      end
    end
    trait :with_transactions do
      transient do
        transaction_count 3
      end
      after(:create) do |customer, evaluator|
        create_list(:transaction, evaluator.transaction_count)
        invoice = create(:invoice, customer: customer)
        create_list(:transaction, evaluator.transaction_count, invoice: invoice)
      end
    end
  end
end
