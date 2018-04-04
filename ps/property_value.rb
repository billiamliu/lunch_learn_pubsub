class PropertyValue
  def initialize(amount: 0, type: nil)
    @amount = amount
    @type = type
  end

  def change_purchase_price(new_price)
    if @amount != new_price
      @amount = new_price
      publish(action: 'PURCHASE_PRICE_CHANGED', new_price: new_price)
    end
  end

  def handle(msg)
    case msg[:action]
    when 'PURCHASE_PRICE_CHANGED'
      change_purchase_price(msg[:new_price])
    end
  end

  def inspect
    <<-LIT
PropertyValue
\tamount: #{@amount}
\ttype: #{@type}
    LIT
  end
end
