class User < ActiveRecord::Base

  has_secure_password

  attr_accessible :email, :name, :password_digest

  validates :email, presence: true, uniqueness: true
  validates_presence_of :name, :password_digest

end
