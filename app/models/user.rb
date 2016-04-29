require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 2 }
  validates :password_hash, presence: true

  has_many :users_subderrits, dependent: :destroy
  has_many :subderrits, through: :users_subderrits
  has_many :pvotes
  has_many :comments
  has_many :cvotes

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
