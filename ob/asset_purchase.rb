class AssetPurchase
  include Observable
  attr_reader :purchase_price, :funds_required

  def initialize(purchase_price: 0, funds_required: 0)
    @purchase_price = purchase_price
    @funds_required = funds_required
  end

  def change_amount(new_price)
    if new_price != @purchase_price
      @funds_required = @purchase_price = new_price
      notify(:change_price, new_price)
    end
  end

  def inspect
    "<AssetPurchase price: #{@purchase_price} funds_required: #{@funds_required}>"
  end
end
