class User < ActiveRecord::Base

  has_secure_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_create { generate_auth_token }

  attr_accessible :email, :name, :password, :password_confirmation

  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: email_regex }
  validates_presence_of :name, :password_digest

  private

  def generate_auth_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists? auth_token: self[:auth_token]
  end

end
