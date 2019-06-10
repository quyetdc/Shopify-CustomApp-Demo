ShopifyApp.configure do |config|
  config.application_name = "Colin Code Shopify"
  config.api_key = ENV['api_key']
  config.secret = ENV['api_secret']
  config.old_secret = ENV['api_secret']
  config.scope = "read_orders, write_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2019-04"
  config.session_repository = Shop

  # config.redirect_uri = "http://localhost:3000/auth/shopify/callback"

end