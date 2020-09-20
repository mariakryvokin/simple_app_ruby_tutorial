class User < ApplicationRecord
  MAX_NAME_LENGTH = 50
  MAX_EMAIL_LENGTH = 255
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: MAX_EMAIL_LENGTH },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  before_save { email.downcase! }
  has_secure_password
end