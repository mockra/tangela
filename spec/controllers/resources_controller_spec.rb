require 'spec_helper'

describe ResourcesController do

  before do
    @user = create :user
    @project = create :project, user: @user
    sign_in @user
  end

  describe 'new' do
    it 'should assign new resource' do
      get :new, project_id: @project
      assigns[:resource].should be_a_new Resource
    end
  end

  describe 'index' do
    before do
      @resources = create_list :resource, 15, user: @user, project: @project
    end

    it 'should assign resources' do
      get :index, project_id: @project
      assigns[:resources].should == @resources
    end
  end

  describe 'create' do
    describe 'success' do
      it 'should create a resource' do
        lambda do
          post :create, resource: { value: 'string' }, project_id: @project
        end.should change( Resource, :count ).by 1
      end
    end

    describe 'failure' do
      it 'should render new' do
        post :create, project_id: @project
        response.should render_template :new
      end
    end
  end

  describe 'destroy' do
    before do
      @resource = create :resource, project: @project, user: @user
    end

    it 'should delete a resource' do
      lambda do
        post :destroy, id: @resource, project_id: @project
      end.should change( Resource, :count ).by -1
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
    it 'should redirect the user' do
      post :new
      response.should redirect_to root_url
    end
  end

  describe 'sort' do
    before do
      @resource = create :resource, project: @project, user: @user
      @resource_two = create :resource, project: @project, user: @user
      @resources = [ @resource_two.id, @resource.id ]
    end

    it 'should update the position' do
      post :sort, resource: @resources
      @resource.reload
      @resource.position.should == 1
      @resource_two.reload
      @resource_two.position.should == 0
    end
  end

end
