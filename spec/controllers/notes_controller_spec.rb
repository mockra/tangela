require 'spec_helper'

describe NotesController do

  before do
    @user = create :user
    @project = create :project, user: @user
    sign_in @user
  end

  describe 'new' do
    it 'should assign new note' do
      get :new, project_id: @project
      assigns[:note].should be_a_new Note
    end
  end

  describe 'create' do
    describe 'success' do
      it 'should create a new note' do
        lambda do
          post :create, note: { content: 'test' }, project_id: @project
        end.should change( Note, :count ).by 1
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
      @note = create :note, project: @project, user: @user
    end
    it 'should delete a note' do
      lambda do
        post :destroy, id: @note, project_id: @project
      end.should change( Note, :count ).by -1
    end
  end

end
