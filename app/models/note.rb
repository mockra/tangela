class Note < ActiveRecord::Base

  attr_accessible :content

  belongs_to :user
  belongs_to :project

  scope :top, order('updated_at DESC').limit(5)

  validates_presence_of :content, :user_id, :project_id

end
