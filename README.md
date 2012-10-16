# EcwidGateway

 [![Build Status](https://secure.travis-ci.org/zzet/ecwid_gateway.png)](http://travis-ci.org/zzet/ecwid_gateway) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/zzet/ecwid_gateway)
 
 Gem for work with Ecwid store API 

## Installation

Add this line to your application's Gemfile:

    gem 'ecwid_gateway'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ecwid_gateway

## Usage

### Configuration

    # Add config/initializers/ecwid_gateway.rb
    EcwidGateway.configure do |config|
      config.store_id = 'your_store_id' 
      config.api_domain = 'http://app.ecwid.com'
      config.order_secure_auth_key = 'your_order_secure_auth_key'
      config.sso_secure_auth_key = 'your_sso_secure_auth_key'
    end

### Usage

    client = EcwidGateway::Client.new

    client.get_categories # Return root category list

    client.get_categories(parent_category_id)

    client.get_products(category_id)
    
    client.get_product(product_id)
    
    client.get_random_products(count)
    
    client.get_profile


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
