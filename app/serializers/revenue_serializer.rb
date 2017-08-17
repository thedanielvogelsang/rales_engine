class RevenueSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    '%.2f' % (object.to_i/100.0)
  end
end
