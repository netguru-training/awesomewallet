class Identity
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :user_id, type: Integer
  belongs_to :user

  def self.find_with_omniauth(auth)
    where(provider: auth['provider'], uid: auth['uid']).first
  end

  def self.create_with_omniauth(auth)
    create(uid: auth['uid'], provider: auth['provider'])
  end
end
