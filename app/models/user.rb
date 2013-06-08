class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  attr_accessible :name, :email
  has_many :identities
  validates_presence_of :name
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })
  has_many :transactions

  def self.create_with_omniauth(auth)
    create! do |user|
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end
