class Api::V1::Merchants::MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :num_items, :items

  def num_items
    object.items.count
  end
  def items
    object.items
  end
end
