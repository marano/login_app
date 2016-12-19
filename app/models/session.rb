class Session
  include ActiveModel::Validations

  attr_accessor :email, :password

  validates :email, :password, length: { minimum: 8 }

  def initialize(attributes = {})
    @email = attributes[:email]
    @password = attributes[:password]
  end
end
