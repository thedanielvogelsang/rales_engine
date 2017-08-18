class CustomerInvoiceSerializer < ActiveModel::Serializer
  attributes :customer_id, :id, :merchant_id, :status
end
