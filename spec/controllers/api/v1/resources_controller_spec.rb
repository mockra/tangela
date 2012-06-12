require 'spec_helper'

describe Api::V1::ResourcesController do

  let(:application) { Doorkeeper::Application.create!(:name => "MyApp", :redirect_uri => "http://app.com") }
  let(:user) { create :user }
  let(:token) { Doorkeeper::AccessToken.create! :application_id => application.id, :resource_owner_id => user.id }
  let(:project) { create :project, user: user }

  describe 'index' do
    before do
      @resources = create_list :resource, 15, user: user, project: project
    end

    it 'should be successful' do
      get :index, project_id: project, format: :json, access_token: token.token
      response.status.should eq 200
    end

    it 'should return projects' do
      get :index, project_id: project, format: :json, access_token: token.token
      response.body.should == @resources.to_json
    end
  end

  describe 'show' do
    before do
      @resource = create :resource, user: user, project: project
    end

    it 'should return the project' do
      get :show, id: @resource, project_id: project, format: :json, access_token: token.token
      response.body.should == @resource.to_json
    end
  end

  describe 'create' do
    before do
      @attr = { value: 'resource string' }
    end

    it 'should create a note' do
      lambda do
        post :create, resource: @attr, project_id: project, format: :json, access_token: token.token
      end.should change( Resource, :count ).by 1
    end
  end

  describe 'update' do
    before do
      @resource = create :resource, user: user, project: project
      @attr = { value: 'updated value' }
    end

    it 'should update the note' do
      post :update, id: @resource, project_id: project, resource: @attr, format: :json, access_token: token.token
      @resource.reload
      @resource.value.should == @attr[:value]
    end
  end

  describe 'destroy' do
    before do
      @resource = create :resource, user: user, project: project
    end

    it 'should destroy the note' do
      lambda do
        post :destroy, id: @resource, project_id: project, format: :json, access_token: token.token
      end.should change( Resource, :count ).by -1
    end
  end

end
