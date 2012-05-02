require 'spec_helper'

describe Resource do

  it { should validate_presence_of :type }
  it { should validate_presence_of :value }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :project_id }

  it { should belong_to :user }
  it { should belong_to :project }

  describe 'value format' do
    before do
      @resource = Resource.new
      @resource.user_id = 1
      @resource.project_id = 1
      @resource.type = 'twitter'
    end
    describe 'failure' do
      it 'should not accept a single word' do
        @resource.value = 'string'
        @resource.should_not be_valid
      end
    end

    describe 'success' do
      it 'should accept a twitter handle' do
        @resource.value = '@Mockra_'
        @resource.should be_valid
      end

      it 'should accept a link' do
        @resource.value = 'www.google.com'
        @resource.should be_valid
      end
    end
  end

end
