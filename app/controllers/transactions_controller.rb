class TransactionsController < ApplicationController
	expose(:transactions) { current_user.transactions }
	expose(:transaction)

  def create
    render :edit and return unless transaction.save
    redirect_to transactions_path, notice: "Transaction created!"
  end

  def update
    render :edit and return unless transaction.save
    redirect_to transactions_path, notice: "Transaction updated!"
  end

  def destroy
    transaction.destroy
    redirect_to transactions_path, notice: "Transaction destroyed!"
  end
end
