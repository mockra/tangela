require 'spec_helper'

describe Api::V1::NotesController do

  let(:application) { Doorkeeper::Application.create!(:name => "MyApp", :redirect_uri => "http://app.com") }
  let(:user) { create :user }
  let(:token) { Doorkeeper::AccessToken.create! :application_id => application.id, :resource_owner_id => user.id }
  let(:project) { create :project, user: user }

  describe 'index' do
    before do
      @notes = create_list :note, 15, user: user, project: project
    end

    it 'should be successful' do
      get :index, project_id: project, format: :json, access_token: token.token
      response.status.should eq 200
    end

    it 'should return projects' do
      get :index, project_id: project, format: :json, access_token: token.token
      response.body.should == @notes.to_json
    end
  end

  describe 'show' do
    before do
      @note = create :note, user: user, project: project
    end

    it 'should return the project' do
      get :show, id: @note, project_id: project, format: :json, access_token: token.token
      response.body.should == @note.to_json
    end
  end

  describe 'create' do
    before do
      @attr = { content: 'test note' }
    end

    it 'should create a note' do
      lambda do
        post :create, note: @attr, project_id: project, format: :json, access_token: token.token
      end.should change( Note, :count ).by 1
    end
  end

  describe 'update' do
    before do
      @note = create :note, user: user, project: project
      @attr = { content: 'updated content' }
    end

    it 'should update the note' do
      post :update, id: @note, project_id: project, note: @attr, format: :json, access_token: token.token
      @note.reload
      @note.content.should == @attr[:content]
    end
  end

  describe 'destroy' do
    before do
      @note = create :note, user: user, project: project
    end

    it 'should destroy the note' do
      lambda do
        post :destroy, id: @note, project_id: project, format: :json, access_token: token.token
      end.should change( Note, :count ).by -1
    end
  end

end
