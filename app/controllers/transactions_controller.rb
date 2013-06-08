class TransactionsController < ApplicationController
	expose(:transactions) { current_user.transactions }

	def create
		render :edit return unless transaction.save
			redirect_to transactions_path, notice: "Transaction created!"
	end

	def update
		render :edit return unless transaction.save
			redirect_to transactions_path, notice: "Transaction updated!"
	end

	def destroy
		transaction.destroy
		redirect_to transactions_path, notice: "Transaction destroyed!"
	end
end
