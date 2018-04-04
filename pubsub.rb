require_relative './ps/channel'
require_relative './ps/loan'
require_relative './ps/asset_purchase'
require_relative './ps/property_value'

purchase_price = 777
loan_amount = 1000


property_value = Channel.build(PropertyValue, amount: purchase_price, type: 'purchase_price')
loan = Channel.build(Loan, amount: loan_amount, cash_to_borrower: loan_amount - purchase_price)
asset_purchase = Channel.build(AssetPurchase, purchase_price: purchase_price, funds_required: purchase_price)

p property_value
p loan
p asset_purchase
puts "\n\n---\n\n"

asset_purchase.change_purchase_price(666)

p property_value
p loan
p asset_purchase
puts "\n\n---\n\n"

property_value.change_purchase_price(555)

p property_value
p loan
p asset_purchase

