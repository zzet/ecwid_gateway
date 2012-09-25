require "weary/client"

module EcwidGateway
  class Client < Weary::Client

    required :store_id
    domain EcwidGateway.options[:api_domain]

    def initialize(attrs = {})
      attrs = EcwidGateway.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])
      end
    end

    #Product_API

    get :categories_request, '/api/v1/:store_id/categories' do |resource|
      resource.required :store_id, :parent
    end

    get :products_request, '/api/v1/:store_id/products' do |resource|
      resource.required :store_id, :category
    end

    get :product_request, '/api/v1/:store_id/product' do |resource|
      resource.required :store_id, :id
    end

    get :random_products_request, '/api/v1/:store_id/random_products' do |resource|
      resource.required :store_id, :count
    end

    get :profile_request, '/api/v1/:store_id/profile' do |resource|
      resource.required :store_id
    end

    get :batch_request, '/api/v1/:store_id/batch' do |resource|
      # TODO: Implement
    end

    # Order_API

    get :orders_request, 'api/v1/:store_id/orders' do |resource|
      resource.required :store_id, :secure_auth_key
      resource.optional :date, :from_date, :to_date,
                        :from_update_date, :to_update_date,
                        :order, :from_order, :to_order,
                        :customer_id, :customer_email,
                        :statuses,
                        :limit,
                        :offset
    end

    post :orders_request, 'api/v1/:store_id/orders' do |resource|
      # TODO: Implement
      resource.required :store_id, :secure_auth_key
      resource.optional :date, :from_date, :to_date,
                        :from_update_date, :to_update_date,
                        :order, :from_order, :to_order,
                        :customer_id, :customer_email,
                        :statuses,
                        :limit,
                        :offset
    end

    def get_categories(category = 0)
      request = categories_request({:store_id => @store_id, :parent => category}).perform
      request.body
    end

    def get_products(category)
      request = products_request({:store_id => @store_id, :category => category}).perform
      request.body
    end

    def get_product(product)
      request = product_request({:store_id => @store_id, :id => product}).perform
      request.body
    end

    def get_random_products(count)
      request = random_products_request({:store_id => @store_id, :count => count}).perform
      request.body
    end

    def get_profile
      request = profile_request({:store_id => @store_id}).perform
      request.body
    end

  end
end
