class Resource < ActiveRecord::Base

  attr_accessible :type, :value

  belongs_to :user
  belongs_to :project

  validates_presence_of :type, :value, :user_id, :project_id

end
