class AssetPurchase
  def initialize(purchase_price: 0, funds_required: 0)
    @purchase_price = purchase_price
    @funds_required = funds_required
  end

  def change_funds_required(requirement)
    if @funds_required != requirement
      @funds_required = requirement
      publish(action: 'FUNDS_REQUIRED_CHANGED', new_requirement: requirement)
    end
  end

  def change_purchase_price(new_price)
    if @purchase_price != new_price
      @purchase_price = new_price
      publish(action: 'PURCHASE_PRICE_CHANGED', new_price: new_price)
    end
  end

  def handle(msg)
    case msg[:action]
    when 'PURCHASE_PRICE_CHANGED'
      change_purchase_price(msg[:new_price])
      change_funds_required(msg[:new_price])
    end
  end

  def inspect
    <<-LIT
AssetPurchase
\tpurchase price: #{@purchase_price}
\tfunds required: #{@funds_required}
    LIT
  end
end
