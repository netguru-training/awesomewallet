class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :name, type: String
  field :amount, type: BigDecimal
  field :kind, type: String

  belongs_to :user

  def kind_class
  	return "success" if kind == "income"
  	return "error" if kind == "outcome"
  end
end
