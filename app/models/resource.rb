class Resource < ActiveRecord::Base

  attr_accessible :value

  before_save :find_format

  belongs_to :user
  belongs_to :project

  validates_presence_of :value, :user_id, :project_id

  private

  def find_format
    self.format = 'string' unless supported_format
  end

  def supported_format
    twitter? || link?
  end

  def twitter?
    self.format = 'twitter' if self.value =~ /\A@[A-Z0-9_]{1,}/i
  end

  def link?
    self.format = 'link' if self.value =~
      /\Ahttp|https|www|(:\/\/){0,1}\.{0,1}[a-z0-9-]{1,}\.{1}.*/i
  end

end
