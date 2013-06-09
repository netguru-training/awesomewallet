module UserHelper
  def balance_label(balance)
    balance > 0 ? "success" : "important"
  end
end
