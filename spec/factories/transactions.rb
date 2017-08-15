FactoryGirl.define do
  factory :transaction do
    invoice
    credit_card_number "MyString"
    credit_card_expiration_date "2017-08-14 18:48:56"
    result "MyString"
  end
end
