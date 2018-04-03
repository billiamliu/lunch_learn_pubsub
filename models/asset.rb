class Asset
  attr_accessor :property_detail, :asset_purchase

  def initialize(property_detail: PropertyDetail.new, asset_purchase: AssetPurchase.new)
    @property_detail = property_detail
    @asset_purchase = asset_purchase
  end

  def inspect
    <<-HEREDOC
    CLASS: Asset
    - property detail: #{property_detail.inspect}
    - asset purchase: #{asset_purchase.inspect}
    HEREDOC
  end
end
