require 'spec_helper'

describe Resource do

  it { should validate_presence_of :value }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :project_id }

  it { should belong_to :user }
  it { should belong_to :project }

  describe 'find_type' do
    before do
      @attr = { user_id: 1, project_id: 1 }
    end

    it 'should be a twitter handle' do
      @resource = Resource.create @attr.merge value: '@Mockra_'
      @resource.reload
      @resource.format.should == 'twitter'
    end

    it 'should be a string' do
      @resource = Resource.create @attr.merge value: 'string'
      @resource.reload
      @resource.format.should == 'string'
    end

    it 'should be a link' do
      @resource = Resource.create @attr.merge value: 'www.google.com'
      @resource.reload
      @resource.format.should == 'link'
    end
  end

end
