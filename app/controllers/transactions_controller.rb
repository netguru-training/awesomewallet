class TransactionsController < ApplicationController
  authenticate_user!

  expose(:transactions) { searched_transactions.page(params[:page]) }
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

  def chart_counts
        
  end

  def chart_balance
    
  end

  def get_transactions
    if params[:data].present? && params[:data][:from].present? && params[:data][:to].present?
      current_user.transactions_per_day(params[:data][:from], params[:data][:from])
    end
  end

  helper_method :get_transactions

private

  def searched_transactions
    search = current_user.transactions
    if params[:date]
      search = search.where(:created_at.gte => Date.parse(params[:date][:from]).beginning_of_day) if params[:date][:from].present?
      search = search.where(:created_at.lte => Date.parse(params[:date][:to]).end_of_day) if params[:date][:to].present?
    end
    search
  end

end
