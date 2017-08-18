class TotalrevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    '%.2f' % (object.to_i/100.0)
  end
end
