class MetafieldsController < AuthenticatedController
  before_action :set_metafield, only: [:destroy, :edit, :update]

  def index
  end

  def new
    @owner_class = params[:owner_class] ? params[:owner_class] : 'Product'
    @owner_id = params[:owner_id] ? params[:owner_id] : ShopifyAPI::Product.find(:all).first.id
    @owner = Object.const_get("ShopifyAPI::#{@owner_class}").find(@owner_id)
    @metafield = Metafield.new
  end

  def edit
    @owner_class = @metafield.owner_resource
    @owner_id = @metafield.owner_id
  end

  def update
    # NAMESPACE & KEY cannot be changed for existing record
    @metafield.attributes.merge! metafield_params
    @metafield.save

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def create
    metafield = Metafield.new(params[:metafield].as_json)
    if metafield.valid?
      metafield.save
    end

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @metafield.destroy
    @destroy_redirect_path = product_path(@owner)
    redirect_to @destroy_redirect_path
  end

  private

  def set_metafield
    @metafield = Metafield.find(params[:id])

    case @metafield.owner_resource
    when 'product'
      @owner = ShopifyAPI::Product.find(@metafield.owner_id)
    end
  end

  def metafield_params
    params.require(:metafield).permit(:namespace, :key, :value, :value_type, :description, :owner_id, :owner_resource)
  end
end
