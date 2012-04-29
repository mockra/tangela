require 'spec_helper'

describe UsersController do

  describe 'new' do
    it 'should assign new user' do
      get :new
      assigns[:user].should be_a_new User
    end
  end

  describe 'create' do
    describe 'success' do
      it 'should create a new user' do
        lambda do
          post :create, user: attributes_for(:user)
        end.should change( User, :count ).by 1
      end

      it 'should set the notice' do
        post :create, user: attributes_for(:user)
        flash[:notice].should =~ /create/i
      end
    end

    describe 'failure' do
      it 'should render new' do
        post :create
        response.should render_template :new
      end
    end
  end

end
