class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :name, type: String
  field :amount, type: Integer
  field :kind, type: String
end
