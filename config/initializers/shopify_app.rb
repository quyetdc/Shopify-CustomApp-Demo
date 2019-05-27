ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = "<api_key>"
  config.secret = "518b229133b386457a38b0cd1fd2c8e4"
  config.old_secret = "<old_secret>"
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2019-04"
  config.session_repository = Shop
end
