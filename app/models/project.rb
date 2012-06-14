class Project < ActiveRecord::Base

  attr_accessible :name, :color

  belongs_to :user
  has_many :resources
  has_many :notes

  validates_presence_of :name, :user_id, :color

end
