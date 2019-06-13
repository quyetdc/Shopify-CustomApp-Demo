class Metafield < ShopifyAPI::Metafield
  attributes = [:namespace, :key, :value, :value_type, :description, :owner_id, :owner_resource]

  attributes.each do |attr|
    attr_accessor attr

    define_method attr.to_sym do
      @attributes[attr.to_sym]
    end
  end

end
