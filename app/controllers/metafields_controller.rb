class MetafieldsController < AuthenticatedController
  def index
  end

  def new
    @owner = Object.const_get("ShopifyAPI::#{params[:owner_class]}").find(params[:owner_id])
  end

  def create
  end
end
