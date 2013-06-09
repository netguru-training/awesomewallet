module TransactionsHelper
  def signed_amount(transaction)
    "#{transaction.kind == :outcome ? '-' : '+'}#{transaction.amount}"
  end
end
