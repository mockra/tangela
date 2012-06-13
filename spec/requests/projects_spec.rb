require 'spec_helper'

describe "Projects" do

  before do
    @user = create :user
    login_as @user
  end

  describe 'index' do
    before do
      @projects = create_list :project, 5, user: @user
      visit projects_path
    end

    it 'should display project titles' do
      @projects.each do |project|
        page.should have_link project.name
      end
    end

    it 'should have new project link' do
      page.should have_xpath "//a[@href = '/projects/new']"
    end
  end

  describe 'show' do
    before do
      @project = create :project, user: @user
      visit project_path @project
    end

    it 'should have project name' do
      page.should have_content @project.name
    end

    it 'should have new resource link' do
      page.should have_xpath "//a[@href = '/projects/#{@project.id}/resources']"
    end

    it 'should have new note form' do
      page.should have_css 'form.new_note'
    end
  end

  describe 'new' do
    before do
      visit new_project_path
    end

    it 'should create a new project' do
      lambda do
        fill_in 'project_name', with: 'project'
        click_button 'Submit'
      end.should change( Project, :count ).by 1
    end
  end

  describe 'edit' do
    before do
      @project = create :project, user: @user
      visit edit_project_path @project
    end

    it 'should update the project' do
      fill_in 'project_name', with: 'updated project'
      click_button 'Submit'
      page.should have_content 'updated project'
    end
  end

end
