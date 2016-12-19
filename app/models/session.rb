class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, :password, length: { minimum: 8 }

  validate :validate_credentials

  private

  def validate_credentials
    errors.add(:base, 'Invalid login information') if password == 'password'
  end
end
