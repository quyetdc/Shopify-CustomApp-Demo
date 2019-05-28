# frozen_string_literal: true

class ProductsController < AuthenticatedController
  def show
    @product = ShopifyAPI::Product.find(params[:id])
  end
end
