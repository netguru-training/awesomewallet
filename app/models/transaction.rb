class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps

  before_create :set_user_balance
  before_create :set_current_balance

  field :user_id, type: Integer
  field :name, type: String
  field :amount, type: BigDecimal
  field :kind, type: Symbol
  field :current_balance, type: BigDecimal

  validates :amount, numericality: true
  validates :name, :kind, :amount, presence: true
  validates :kind, inclusion: { in: %i(income outcome) }

  belongs_to :user

  default_scope desc(:created_at) 

  def kind_class
    case kind
    when :income then "success"
    when :outcome then "error"
    end
  end

  private
  def set_current_balance
    self.current_balance = user.balance
  end

  def set_user_balance
    kind == :income ? user.balance += amount : user.balance -= amount
    user.save
  end
end
