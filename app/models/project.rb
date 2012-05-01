class Project < ActiveRecord::Base

  attr_accessible :name

  belongs_to :user
  has_many :resources

  validates_presence_of :name, :user_id

end
