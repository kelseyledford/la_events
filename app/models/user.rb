require "bcrypt"
class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  # User set as admin is allowed to delete events
  field :is_admin, type: Boolean

  # Adds a password confirmation box in the sign up form
  has_secure_password

  validates :name, :presence => { :message => "Please enter a username"}, :uniqueness => { :message => "Username is taken" }
  validates :email, :presence => { :message => "Please enter an email address"}, :uniqueness => { :message => "Email address is already registered" }
  validates_email_format_of :email, :message => "Please enter a valid email address"
  validates_presence_of :email, :message => "Please complete the form"
  validates_length_of :password, :minimum => 5, :message => "Password is too short (minimum 5 characters)"

  # Allows you to call the password temporarily but not after it's saved to the db
  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    # This encrypted password is saved to the db
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    # Tests the entered password against the encrypted password saved in the db
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    # If the password doesn't match, return false
    else
      false
    end
  end
end
