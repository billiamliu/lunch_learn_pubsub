class Loan
  attr_accessor :use_of_loan_fund, :amount, :cash_to_borrower

  def initialize(use_of_loan_fund: nil, amount: 0, cash_to_borrower: 0)
    @use_of_loan_fund = use_of_loan_fund
    @amount = amount
    @cash_to_borrower = cash_to_borrower
  end

  def inspect
    <<-WAT
CLASS: Loan
    - use of loan fund: #{@use_of_loan_fund.inspect}
    - amount: #{@amount}
    - cash to borrower: #{@cash_to_borrower}
    WAT
  end
end
