class PropertyValue
  include Observable
  attr_reader :amount, :type

  def initialize(amount: 0, type: nil)
    @amount = amount
    @type = type
  end

  def update_amount(new_amount)
    if new_amount != @amount
      @amount = new_amount
      notify(:change_amount, new_amount)
    end
  end

  def inspect
    "<PropertyValue: #{@type} #{@amount}>"
  end
end
