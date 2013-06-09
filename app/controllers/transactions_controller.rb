class TransactionsController < ApplicationController
  authenticate_user!

  expose(:transactions) { searched_transactions.page(params[:page]) }
  expose(:transaction)

  def index
    @plot_data = if params[:date] && params[:date][:from] && params[:date][:to]
                   current_user.transactions_per_day(Date.parse(params[:date][:from]), Date.parse(params[:date][:to]))
                 end
  end

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
  end

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
