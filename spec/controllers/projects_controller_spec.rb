require 'spec_helper'

describe ProjectsController do


  describe 'new' do
    it 'assign project' do
      get :new
      assigns[:project].should be_a_new Project
    end
  end

  describe 'create' do
    before do
      @user = create :user
      sign_in @user
    end

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

end
