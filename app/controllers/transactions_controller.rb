class TransactionsController < ApplicationController
  authenticate_user!

  expose(:transactions) { current_user.transactions.page(params[:page]) }
  expose(:transaction)

  def create
    if transaction.save
      redirect_to transactions_path, notice: "Transaction created!"
    else
      render :new
    end
  end

  def update
    if transaction.save
      redirect_to transactions_path, notice: "Transaction updated!"
    else
      render :edit
    end
  end

  def destroy
    transaction.destroy
    redirect_to transactions_path, notice: "Transaction destroyed!"
  end
end
