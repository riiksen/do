require "granite_orm/adapter/sqlite"
require "crypto/bcrypt/password"

class User < Granite::ORM::Base
  include Crypto
  adapter sqlite
  primary id : Int64
  field email : String
  field username : String
  field name : String
  field address : String
  field hashed_password : String
  field verified : Bool

  has_many :orders

  validate :email, "is required", -> (user : User) do
    (email = user.email) ? !email.empty? : false
  end

  validate :email, "already in use", -> (user : User) do
    existing = User.find_by :email, user.email
    !existing
  end

  validate :password, "is too short", -> (user : User) do
    user.password_changed? ? user.valid_password_size? : true
  end

  def password=(password)
    @new_password = password
    @hashed_password = Bcrypt::Password.create(password, cost: 10).to_s
  end

  def password
    (hash = hashed_password) ? Bcrypt::Password.new(hash) : nil
  end

  def password_changed?
    new_password ? true : false
  end

  def valid_password_size?
    (pass = new_password) ? pass.size >= 8 : false
  end

  def authenticate(password : String)
    (bcrypt_pass = self.password) ? bcrypt_pass == password : false
  end

  private getter new_password : String?
end
