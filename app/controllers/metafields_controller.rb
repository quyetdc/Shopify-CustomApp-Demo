class MetafieldsController < AuthenticatedController
  def index
  end

  def new
    @owner_class = params[:owner_class] ? params[:owner_class] : 'Product'
    @owner_id = params[:owner_id] ? params[:owner_id] : ShopifyAPI::Product.find(:all).first.id
    @owner = Object.const_get("ShopifyAPI::#{@owner_class}").find(@owner_id)
    @metafield = ShopifyAPI::Metafield.new()
  end

  def create
    # owner = Object.const_get("ShopifyAPI::#{params[:metafield][:owner_class]}").find(params[:metafield][:owner_id])

    metafield = ShopifyAPI::Metafield.new(params[:metafield].as_json)
    if metafield.valid?
      metafield.save
    end

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
