require_relative './so/asset'
require_relative './so/property_detail'
require_relative './so/property_value'
require_relative './so/asset_purchase'
require_relative './so/loan'

class UpdatePurchasePrice
  def self.call(new_price, property_value:, asset_purchase:, loan:)
    property_value.amount = new_price
    asset_purchase.purchase_price = new_price
    asset_purchase.funds_required = new_price
    loan.cash_to_borrower = loan.amount - new_price
  end
end

# driver code below ---

class ExampleOne
  attr_reader :asset, :asset_purchase, :loan

  def self.shout(str)
    "\n\n>>>#{str}<<<\n\n"
  end

  def self.run
    new.tap do |ex|
      puts shout('Setup')
      p ex

      puts shout('Add Some Property Values')
      ex.add_property_value
      p ex

      puts shout('Update Purchase Price')
      ex.update_purchase_price(133)
      p ex
    end
    nil
  end

  def initialize
    loan_amount = 1000

    @asset_purchase = AssetPurchase.new(purchase_price: 0, funds_required: 0)
    @asset = Asset.new(asset_purchase: @asset_purchase)

    @loan = Loan.new(use_of_loan_fund: @asset_purchase, amount: loan_amount, cash_to_borrower: loan_amount)
  end

  def add_property_value(amount: nil, type: nil)
    if amount && type
      if purchase = property_values.find { |v| v.type == 'purchase_price' }
        purchase.amount = amount
      else 
        @asset.property_detail.add(PropertyValue.new amount: amount, type: type)
      end
    else
      generate_property_values
    end
  end

  def property_values
    @asset.property_detail.property_values
  end

  def update_purchase_price(price)
    if property_value = property_values.find { |v| v.type == 'purchase_price' }
      UpdatePurchasePrice.(
        price,
        property_value: property_value,
        asset_purchase: asset_purchase,
        loan: loan
      )
    end
  end

  def inspect
    <<-WAT
<#{self.class.to_s}>
#{@asset.inspect}
#{@loan.inspect}
    WAT
  end

  private

  def generate_property_values
    add_property_value(amount: 999, type: 'lender_estimate')
    add_property_value(amount: 777, type: 'purchase_price')
    @asset_purchase.purchase_price = @asset_purchase.funds_required = 777
  end
end

ExampleOne.run
