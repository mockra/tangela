class Note < ActiveRecord::Base

  attr_accessible :content

  belongs_to :user
  belongs_to :project

  scope :sorted, order('completed_at ASC').order('position')
  scope :top, order('updated_at DESC').limit(5)

  validates_presence_of :content, :user_id, :project_id

end
