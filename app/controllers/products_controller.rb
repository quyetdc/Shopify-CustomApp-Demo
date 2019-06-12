# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def index
    # @products = ShopifyAPI::Product.find(:all, params: { limit: 1, page: 1 })

    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
  end

  def show
    Struct.new("Metafield", :src, :alt)

    @product = ShopifyAPI::Product.find(params[:id])
    @images = []

    # store header for request call to Shopify API
    headers = {"X-Shopify-Access-Token" => @shop_session.token}

    @metafields = HTTParty.get('https://quyet-akronym-store.myshopify.com/admin/metafields.json?metafield[owner_id]=' +
                                params[:id] +'&metafield[owner_resource]=product',
                                :headers => headers).values[0].map { |metafield| OpenStruct.new metafield }



    # @product.images.each do |image|
    #   id = image.id.to_s
    #   src = image.src
    #
    #   #make the request and store it in a variable
    #   metafields = HTTParty.get('https://quyet-akronym-store.myshopify.com/admin/metafields.json?metafield[owner_id]=' +
    #                                 id +'&metafield[owner_resource]=product_image',
    #                             :headers => headers).values
    #
    #   metafields.first.present? ? alt = metafields.first['value'] : alt = @product.title
    #
    #   image = Struct::Image.new(src, alt)
    #
    #   #add the returned data to the @image_metafiels array
    #   @images.push(image)
    # end
  end

end
