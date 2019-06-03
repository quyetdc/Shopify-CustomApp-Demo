FactoryBot.define do
  factory :product do
    shopify_id { "Akronym" }
    shopify_product_type { "Coffee" }
    shopify_title { "DrinkMorning" }
    shopify_available_for_sale { true }
    shopify_image_url { "MyString" }
    shop_id { nil }
  end
end