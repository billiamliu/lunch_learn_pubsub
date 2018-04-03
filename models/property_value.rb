class PropertyValue
  attr_accessor :amount, :type

  def initialize(amount: 0, type: 0)
    @amount = amount
    @type = type
  end

  def inspect
    "<PropertyValue amount: #{amount} type: #{type}>"
  end
end
