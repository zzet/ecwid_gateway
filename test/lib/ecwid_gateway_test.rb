require 'test_helper'

class EcwidGatewayTest < TestCase
  def setup
    EcwidGateway.configure do |conig|
      conig.store_id = '123456'
      conig.api_domain = 'http://localhost'
      conig.order_secure_auth_key = 'some_key'
      conig.sso_secure_auth_key = 'sso_key'
    end

    @client = EcwidGateway::Client.new
    @domain = EcwidGateway.options[:api_domain]
    @store_id = EcwidGateway.options[:store_id]
  end

  def test_lookup_http_query
    @stub = stub_request(:get, "#{@domain}/api/v1/#{@store_id}/categories?parent=0").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => load_fixture('root_categories.json'), :headers => {})

    @client.get_categories

    assert_requested @stub
  end

  def test_get_root_categories
    @stub = stub_request(:get, "#{@domain}/api/v1/#{@store_id}/categories?parent=0").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => load_fixture('root_categories.json'), :headers => {})

    categories = @client.get_categories

    assert_equal 3, categories.count

    first_category = categories[0]
    assert_equal "Type", first_category["name"]
  end

  def test_get_category_subcategories
    category = 123
    @stub = stub_request(:get, "#{@domain}/api/v1/#{@store_id}/categories?parent=#{category}").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => load_fixture('type_category_subcategories.json'), :headers => {})

    categories = @client.get_categories(category)

    assert_equal 3, categories.count

    first_category = categories[0]
    assert_equal "Type_1", first_category["name"]
  end


  def test_get_category_products
    category = 123
    @stub = stub_request(:get, "#{@domain}/api/v1/#{@store_id}/products?category=#{category}").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => load_fixture('category_products.json'), :headers => {})

    products = @client.get_products(category)

    assert_equal 5, products.count

    first_product = products[0]
    assert_equal "Name_1", first_product["name"]
  end


  def test_get_product
    product = 123
    @stub = stub_request(:get, "#{@domain}/api/v1/#{@store_id}/product?id=#{product}").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => load_fixture('product.json'), :headers => {})

    product_info = @client.get_product(product)

    assert_equal 15, product_info.count

    assert_equal "Name_1", product_info["name"]
  end


  def test_get_ranmod_product
    count = 10
    @stub = stub_request(:get, "#{@domain}/api/v1/#{@store_id}/random_products?count=#{count}").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => load_fixture('random_products.json'), :headers => {})

    random_products = @client.get_random_products(count)

    assert_equal 10, random_products.count

    product_info = random_products[0]

    assert_equal "Name_1", product_info["name"]
  end

  def test_get_profile
    @stub = stub_request(:get, "#{@domain}/api/v1/#{@store_id}/profile").
      with(:headers => {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => load_fixture('profile.json'), :headers => {})

    profile = @client.get_profile

    assert_equal 11, profile.count

    assert_equal "Example store", profile["storeName"]
  end

end
