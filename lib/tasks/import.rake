require 'csv'
require 'open-uri'

url = "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/customers.csv"
url_data = open(url).read()

task :import, [:filename] => :environment do
  CSV.open(url_data, :headers => true) do |row|
    Merchant.create!(row.to_hash)
  end
end
