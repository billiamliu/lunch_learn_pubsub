class PropertyDetail
  attr_reader :property_values

  def initialize(property_values: [])
    @property_values = property_values
  end

  def property_values=(values)
    @property_values = values if values.kind_of?(Array)
  end

  def add(value)
    property_values << value
  end

  def purchase_price
    property_values.find { |v| v.type == 'purchase_price' }
  end

  def inspect
    "<PropertyDetail property_values: [#{property_values}]>"
  end
end
