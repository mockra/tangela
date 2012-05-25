require 'spec_helper'

describe "Resources" do

  before do
    @user = create :user
    @project = create :project, user: @user
    login_as @user
  end

  describe 'new', js: true do
    before do
      visit project_path @project
    end

    it 'should have a hidden resource modal' do
      page.should have_no_xpath 'div.modal'
    end

    it 'should open resource model' do
      find( :css, 'a.resource-btn' ).click
      lambda do
        fill_in 'resource_value', with: 'google.com'
        click_button 'Submit'
      end.should change( Resource, :count ).by 1
    end
  end

  describe 'index' do
    before do
      @resources = create_list :resource, 5, user: @user, project: @project
      visit project_resources_path project_id: @project.id
    end

    it 'should show the resources' do
      @resources.each do |resource|
        page.should have_content resource.value
      end
    end
  end

end
