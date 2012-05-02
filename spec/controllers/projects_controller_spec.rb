require 'spec_helper'

describe ProjectsController do

  before do
    @user = create :user
    sign_in @user
  end

  describe 'new' do
    it 'assign project' do
      get :new
      assigns[:project].should be_a_new Project
    end
  end

  describe 'create' do

    describe 'success' do
      it 'should create a new project' do
        lambda do
          post :create, project: attributes_for(:project)
        end.should change( Project, :count ).by 1
      end

      it 'should set the notice' do
        post :create, project: attributes_for(:project)
        flash[:notice].should =~ /create/i
      end
    end

    describe 'failure' do
      it 'should render new template' do
        post :create
        response.should render_template :new
      end
    end
  end

  describe 'index' do
    before do
      @projects = create_list :project, 5, user: @user
    end

    it 'should assign projects' do
      get :index
      assigns[:projects].should == @projects
    end
  end

  describe 'show' do
    before do
      @project = create :project, user: @user
    end

    it 'should assign project' do
      get :show, id: @project
      assigns[:project].should == @project
    end
  end

  describe 'destroy' do
    before do
      @project = create :project, user: @user
    end

    it 'should delete the project' do
      lambda do
        post :destroy, id: @project
      end.should change( Project, :count ).by -1
    end
  end

  describe 'no current_user' do
    before do
      log_out
    end

    it 'should redirect the visitor' do
      get :new
      response.should redirect_to new_session_url
    end
  end

  describe 'protection' do
    before do
      @project = create :project
    end

    it 'should redirect the user' do
      get :show, id: @project
      response.should redirect_to root_url
    end
  end

end
