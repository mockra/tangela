require 'spec_helper'

describe Note do

  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :project_id }

  it { should belong_to :user }
  it { should belong_to :project }

end
