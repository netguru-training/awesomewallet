class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id, type: Integer
  field :name, type: String
  field :amount, type: BigDecimal
  field :kind, type: Symbol

  validates_numericality_of :amount

  belongs_to :user

  def kind_class
    case kind
    when :income then "success"
    when :outcome then "error"
    end
  end
end
