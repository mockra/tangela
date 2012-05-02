require 'spec_helper'

describe Resource do

  it { should validate_presence_of :value }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :project_id }

  it { should belong_to :user }
  it { should belong_to :project }

  describe 'find_type' do
    before do
      @resource = Resource.new
      @resource.user_id = 1
      @resource.project_id = 1
    end

    it 'should be a twitter handle' do
      @resource.value = '@Mockra_'
      @resource.save
      @resource.format.should == 'twitter'
    end

    it 'should be a string' do
      @resource.value = 'string'
      @resource.save
      @resource.format.should == 'string'
    end

    it 'should be a link' do
      @resource.value = 'www.google.com'
      @resource.save
      @resource.format.should == 'link'
    end
  end

end
