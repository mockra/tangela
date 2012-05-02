class Project < ActiveRecord::Base

  attr_accessible :name

  belongs_to :user
  has_many :resources
  has_many :notes

  validates_presence_of :name, :user_id

end
