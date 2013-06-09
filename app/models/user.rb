class User
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :balance, type: BigDecimal, default: 0
  index({ email: 1 }, { unique: true, background: true })

  has_many :identities
  has_many :transactions

  validates_presence_of :name

  attr_accessible :name, :email

  def self.create_with_omniauth(auth)
    user = User.where(email: auth['info']['email']).first
    return user if user.present?
    create! do |user|
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def total_amount(kind)
    transactions.where(kind: kind).map(&:amount).sum.to_f
  end

  def transactions_per_day(from, to)
    searched = transactions.by_date_range(from, to)
    searched.group_by{ |transaction| transaction.created_at.to_date }.collect{ |group| {date: group[0] , number_of_transactions: group[1].count} }
  end

  def balance_history(start_date, end_date)
    data = transactions.by_date_range(start_date, end_date).
      group_by{ |t| t.created_at.to_date }.map { |k, v| { data: k, balance: v.first.current_balance } }
  end
end
