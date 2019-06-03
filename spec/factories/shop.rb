FactoryBot.define do
  factory :shop do
    shopify_domain {ENV['SHOPIFY_SHOP_DOMAIN']}
    shopify_token {ENV['SHOPIFY_SHOP_TOKEN']}
  end
end