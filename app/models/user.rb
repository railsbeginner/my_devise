class User < ActiveRecord::Base
  has_secure_password
  validates :username, :password, :password_confirmation, presence: true
end
