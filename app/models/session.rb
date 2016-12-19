class Session
  include ActiveModel::Validations

  attr_accessor :email, :password

  validates :email, :password, length: { minimum: 8 }

  validate :validate_credentials

  def initialize(attributes = {})
    @email = attributes[:email]
    @password = attributes[:password]
  end

  private

  def validate_credentials
    errors.add(:base, 'Invalid login information') if password == 'password'
  end
end
