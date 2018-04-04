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
    "<PropertyDetail #{
    if property_values.length > 0
      "\n\t" + property_values.map(&:inspect).join("\n\t") + "\n\t"
    else
      '[]'
    end
    }>"
  end
end
