require 'csv'
require 'open-uri'

urls = {
  "Merchant" => "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/merchants.csv",
  "Customer" => "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/customers.csv",
  "Invoice" => "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/invoices.csv",
  "Item" => "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/items.csv",
  "InvoiceItem" => "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/invoice_items.csv",
  "Transaction" => "https://raw.githubusercontent.com/turingschool-examples/sales_engine/master/data/transactions.csv"
}


urls.each do |model, url|
  url_data = open(url).read()
  task :import, [:filename] => :environment do
    puts "importing #{model} records"
    CSV.parse(url_data, :headers => true) do |row|
      (model.camelize.constantize).create!(row.to_hash)
    end
    puts "importing #{model} completed"
  end
end
