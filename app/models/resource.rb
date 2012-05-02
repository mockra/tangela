class Resource < ActiveRecord::Base

  attr_accessible :type, :value

  link_regex = /\Ahttp|https|www|(:\/\/){0,1}\.{0,1}[a-z0-9-]{1,}\.{1}.*/i
  twitter_regex = /\A@[A-Z0-9_]*/i

  belongs_to :user
  belongs_to :project

  validates_presence_of :type, :value, :user_id, :project_id
  validates :value, format: { with: Regexp.union( link_regex, twitter_regex ) }

end
