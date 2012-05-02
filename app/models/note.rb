class Note < ActiveRecord::Base

  attr_accessible :content

  belongs_to :user
  belongs_to :project

  validates_presence_of :content, :user_id, :project_id

end
