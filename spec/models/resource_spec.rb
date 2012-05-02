require 'spec_helper'

describe Resource do

  it { should validate_presence_of :value }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :project_id }

  it { should belong_to :user }
  it { should belong_to :project }

  describe 'find_format' do
    before do
      @resource = Resource.new
      @resource.user_id = 1
      @resource.project_id = 1
    end

    it 'should be a twitter handle' do
      handles = %w[ @Mockra_ @dhh @mo_ckra ]
      handles.each do |handle|
        @resource.value = handle
        @resource.save
        @resource.format.should == 'twitter'
      end
    end

    it 'should be a string' do
      strings = [ 'string' 'str_ing' 'testing. sentences.' 'this @test' ]
      strings.each do |string|
        @resource.value = string
        @resource.save
        @resource.format.should == 'string'
      end
    end

    it 'should be a link' do
      links = %w[ google.com http://test.net https://www.google.com ]
      links.each do |link|
        @resource.value = 'www.google.com'
        @resource.save
        @resource.format.should == 'link'
      end
    end
  end

end
