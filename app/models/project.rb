class Project < ActiveRecord::Base
  attr_accessible :name, :user_id

  validates_presence_of :name, :user_id

end
