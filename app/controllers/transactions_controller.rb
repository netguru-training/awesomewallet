class TransactionsController < ApplicationController
	expose(:transactions) { current_user.transactions }


end
