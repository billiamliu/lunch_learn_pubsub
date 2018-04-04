class Loan
  def initialize(amount: 0, cash_to_borrower: 0)
    @amount = amount
    @cash_to_borrower = cash_to_borrower
  end

  def change_cash_to_borrower(reduction)
    diff = @amount - reduction
    unless diff == @cash_to_borrower
      @cash_to_borrower = diff
      publish(action: 'CASH_TO_BORROWER_CHANGED', new_cash_amount: diff)
    end
  end

  def handle(msg)
    case msg[:action]
    when 'PURCHASE_PRICE_CHANGED'
      change_cash_to_borrower(msg[:new_price])
    end
  end

  def inspect
    <<-LIT
Loan
\tamount: #{@amount}
\tcash to borrower: #{@cash_to_borrower}
    LIT
  end
end
