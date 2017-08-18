# Rales Engine

Using a rake import task, CSV data is loaded into a POSTGRES database. Rails and ActiveRecord are used to build a JSON API which exposes the SalesEngine data schema.

##DTR

https://gist.github.com/thedanielvogelsang/0bca4d3f136463928da1cda4f02591ca

##Getting Started

Rales Engine is a Ruby on Rails Application that requires both Ruby and Rails to be installed on your machine

Ruby:
From your bash run:
```
ruby -v
```

You should see something similar to:
```
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]
```

Follow a similar process for Rails:
```
rails -v
```

You should see something similar to:
```
Rails 5.1.3
```

If Ruby or Rails is not installed on your machine, please see the following links:
https://www.ruby-lang.org/en/documentation/installation/
http://railsapps.github.io/installrubyonrails-mac.html


After ensuring you have Ruby and Rails installed, clone this project to your desired directory:
```
'bash' git clone git@github.com:thedanielvogelsang/rales_engine.git
```

Change directory to rales_engine:
```
'bash' cd rales_engine
```

Bundle:
```
'bash' bundle install
```

Create Database:
```
'bash' rake db:create
```

Migrate Database:
```
'bash' rake db:migrate  
```

Import Database Records:
```
'bash' rake import
```

Note: "rake db:seed" is not used as a separate "rake import" task exists to seed the database from web-hosted CSV files.

##Using Rales Engine
Your Rales Engine is ready to go.

Testing:
RSpec is the primary testing tool used for this project. To run the developer built testing suite, type:
```
'bash' rspec
```

Launching Rails in your local environment:
```
'bash' rails s
```

Once you see something similar to:
```
=> Booting Puma
=> Rails 5.1.3 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.9.1 (ruby 2.4.1-p111), codename: Private Caller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://0.0.0.0:3000
Use Ctrl-C to stop
```

Note: http://localhost:3000 is the URL of the locally launched project.

Head to your preferred web browser.

Here are a few fun links to browse to (all output in JSON):
List of all Merchants:              http://localhost:3000/api/v1/merchants
List of all Items:                  http://localhost:3000/api/v1/items
See an Items best selling day:      http://localhost:3000/api/v1/items/1/best_day
See a Customer's favorite merchant: http://localhost:3000/api/v1/customers/1/favorite_merchant

##Authors

* **Matt DeVoe** - [GitHub](https://github.com/mdevoe12)
* **Daniel Vogelsang** - [GitHub](https://github.com/thedanielvogelsang)
