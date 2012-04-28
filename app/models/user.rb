class User < ActiveRecord::Base

  has_secure_password

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_accessible :email, :name, :password, :password_confirmation

  validates :email, presence: true, uniqueness: { case_sensitive: false },
    format: { with: email_regex }
  validates_presence_of :name, :password_digest

end
