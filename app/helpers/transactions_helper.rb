module TransactionsHelper
  def signed_amount(transaction)
    "#{transaction.kind == :outcome ? '-' : '+'}#{transaction.amount}"
  end

  def kind_label(transaction)
    case transaction.kind
    when :income then "success"
    when :outcome then "error"
    end
  end
end
