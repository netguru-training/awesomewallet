class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: Integer
  field :name, type: String
  field :amount, type: BigDecimal
  field :kind, type: Symbol
  field :current_balance, type: BigDecimal

  validates :amount, numericality: true
  validates :name, :kind, :amount, :user_id, :current_balance, presence: true
  validates :kind, inclusion: { in: %w(income outcome) }

  belongs_to :user

  def kind_class
    case kind
    when :income then "success"
    when :outcome then "error"
    end
  end
end
