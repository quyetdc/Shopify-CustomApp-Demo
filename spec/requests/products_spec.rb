require 'rails_helper'

RSpec.describe "Products", type: :request do

  def login(shop)
    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:shopify,
                             provider: 'shopify',
                             uid: shop.shopify_domain,
                             credentials: { token: shop.shopify_token })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:shopify]

    get "/auth/shopify"
    follow_redirect!

  end

  describe "GET /products" do
    it "Products return with a HTTP status 200" do
      shop = FactoryBot.create(:shop)
      # product = FactoryBot.create(:product)

      login(shop)
      @request.session[:shopify] = shop.id
      @request.session[:shopify_domain] = shop.shopify_domain
      # get product_path(product)

      get root_path
      expect(response).to have_http_status(200)
    end
  end
end