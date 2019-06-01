# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def show
    @product = ShopifyAPI::Product.find(params[:id])
    @image_metafields = []

    # store header for request call to Shopify API
    headers = {"X-Shopify-Access-Token" => @shop_session.token}

    @product.images.each do |image|
      id = image.id.to_s

      #make the request and store it in a variable
      metafields = HTTParty.get('https://quyet-akronym-store.myshopify.com/admin/metafields.json?metafield[owner_id]='+ id +'&metafield[owner_resource]=product_image', :headers => headers).values

      #add the returned data to the @image_metafiels array
      @image_metafields.push(metafields)
    end

  end
end
