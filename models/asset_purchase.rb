class AssetPurchase
  attr_accessor :purchase_price, :funds_required

  def initialize(purchase_price: 0, funds_required: 0)
    @purchase_price = purchase_price
    @funds_required = funds_required
  end

  def inspect
    "<AssetPurchase purchase_price: #{purchase_price} funds required: #{funds_required}>"
  end
end
