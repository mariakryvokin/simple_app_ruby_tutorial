class User < ApplicationRecord
  MAX_NAME_LENGTH = 50
  MAX_EMAIL_LENGTH = 255
  MIN_PASSWORD_LENGTH = 6
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :password, presence: true, length: { minimum: MIN_PASSWORD_LENGTH }, allow_nil: true
  validates :email, presence: true, length: { maximum: MAX_EMAIL_LENGTH },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  before_save { email.downcase! }
  has_secure_password
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
