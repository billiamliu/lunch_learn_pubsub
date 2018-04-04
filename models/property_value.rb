class PropertyValue
  attr_accessor :amount, :type

  def initialize(amount: 0, type: nil)
    @amount = amount
    @type = type
  end

  def inspect
    "<PropertyValue #{type} #{amount}>"
  end
end
