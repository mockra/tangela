require 'spec_helper'

describe Project do

  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id }

  it { should have_many :resources }

end
