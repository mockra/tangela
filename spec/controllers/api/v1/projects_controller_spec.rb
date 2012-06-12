require 'spec_helper'

describe Api::V1::ProjectsController do

    let(:application) { Doorkeeper::Application.create!(:name => "MyApp", :redirect_uri => "http://app.com") }
    let(:user) { create :user }
    let(:token) { Doorkeeper::AccessToken.create! :application_id => application.id, :resource_owner_id => user.id }

  describe 'index' do
    before do
      @projects = create_list :project, 15, user: user
    end

    it 'should be successful' do
      get :index, format: :json, access_token: token.token
      response.status.should eq 200
    end

    it 'should return projects' do
      get :index, format: :json, access_token: token.token
      response.body.should == @projects.to_json
    end
  end

  describe 'show' do
    before do
      @project = create :project, user: user
    end

    it 'should return the project' do
      get :show, format: :json, access_token: token.token, id: @project.id
      response.body.should == @project.to_json
    end
  end

  describe 'create' do
    before do
      @attr = { name: 'project' }
    end

    it 'should create a project' do
      lambda do
        post :create, project: @attr, format: :json, access_token: token.token
      end.should change( Project, :count ).by 1
    end
  end

  describe 'destroy' do
    before do
      @project = create :project, user: user
    end

    it 'should delete the project' do
      lambda do
        post :destroy, id: @project.id, format: :json, access_token: token.token
      end.should change( Project, :count ).by -1
    end
  end

  describe 'update' do
    before do
      @project = create :project, user: user
      @attr = { name: 'updated project' }
    end

    it 'should update the project' do
      post :update, id: @project.id, project: @attr, format: :json, access_token: token.token
      @project.reload
      @project.name.should == @attr[:name]
    end
  end

end
