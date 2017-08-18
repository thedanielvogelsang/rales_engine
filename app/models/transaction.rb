class Transaction < ApplicationRecord
  belongs_to :invoice

  scope :successful, -> {where(result: 'success')}
  scope :not_successful, -> { where(result: 'failed')}

  def self.customer_transactions(id)
    joins(:invoice)
    .merge(Invoice.where(customer_id: id))
  end
end
