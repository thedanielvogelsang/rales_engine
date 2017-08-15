require 'csv'
require 'open-uri'

url = "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/merchants.csv"
urls = {
  "Merchant" => "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/merchants.csv"
}

urls.each do |model, url|
  url_data = open(url).read()

  task :import, [:filename] => :environment do
    CSV.parse(url_data, :headers => true) do |row|
      (model.camelize.constantize).create!(row.to_hash)
    end
  end
end
