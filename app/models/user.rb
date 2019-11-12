class User < ApplicationRecord
  has_secure_password
  has_many :reasons

  validates :email, presence: true, uniqueness: true
end