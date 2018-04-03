class Asset
  has_one :property_detail
  has_one :asset_purchase
end

class PropertyDetail
  belongs_to :asset
  has_many :property_values
end

class PropertyValue
  belongs_to :property_detail
  after_save :update_asset_purchase

  attr_reader :value, :type

  def purchase_price?
    type == 'property_purchase'
  end

  private

  def update_asset_purchase
    if purchase_price?
      asset_purchase = property_detail.asset.asset_purchase
      asset_purchase.purchase_price = value
      asset_purchase.funds_required = value - asset_purchase.down_payment

      loan = asset_purchase.loan
      loan.cash_to_borrower = loan.amount - value
    end
  end
end

# ---

class Loan
  has_one :asset_purchase

  attr_reader :asset_purchase, :amount, :cash_to_borrower
end

class AssetPurchase
  belongs_to :loan
  belongs_to :asset

  attr_reader :purchase_price, :funds_required

  before_save :update_property_value

  def update_property_value
    asset.property_detail.property_value = purchase_price

    loan.cash_to_borrower = loan.amount - purchase_price
  end
end
