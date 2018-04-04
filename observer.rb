require_relative './ob/observable'
require_relative './ob/asset_purchase'
require_relative './ob/property_value'
require_relative './ob/loan'

purchase_price = 777
loan_amount = 1000

property_value = PropertyValue.new(amount: purchase_price, type: 'purchase_price')
asset_purchase = AssetPurchase.new(purchase_price: purchase_price, funds_required: purchase_price)
loan = Loan.new(asset_purchase: asset_purchase, amount: loan_amount)

loan.subscribe_to(asset_purchase)
asset_purchase.subscribe_to(property_value)

p property_value
p asset_purchase
p loan

property_value.update_amount(555)
puts "\n\n---\n\n"

p property_value
p asset_purchase
p loan
