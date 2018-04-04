class Loan
  include Observable
  attr_reader :asset_purchase, :amount

  def initialize(asset_purchase: nil, amount: 0)
    @asset_purchase = asset_purchase
    @amount = amount
    @cash_to_borrower = asset_purchase ? amount - asset_purchase.purchase_price : amount
  end

  def change_price(new_price)
    @cash_to_borrower = @amount - new_price
  end

  def inspect
    "<Loan amount: #{@amount} cash_to_borrower #{@cash_to_borrower}>"
  end
end

