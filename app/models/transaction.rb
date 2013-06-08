class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :name, type: String
  field :amount, type: BigDecimal
  field :kind, type: String
  field :current_balance, type: BigDecimal

  validates :amount, numericality: true
  validates :name, :kind, :amount, :user_id, :current_balance, presence: true

  belongs_to :user
end
