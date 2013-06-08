class TransactionsController < ApplicationController
	expose(:transactions) { current_user.transactions }
	expose(:transaction, ancestor: :transactions)

end
