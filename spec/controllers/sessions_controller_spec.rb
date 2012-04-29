require 'spec_helper'

describe SessionsController do

  before do
    @user = create :user
  end

  describe 'new' do
    it 'should be successful' do
      get :new
      response.should be_success
    end
  end

  describe 'create' do
    describe 'success' do
      it 'should set the auth cookie' do
        post :create, email: @user.email, password: @user.password
        cookies[:auth_token].should == @user.auth_token
      end

      it 'should set the notice' do
        post :create, email: @user.email, password: @user.password
        flash[:notice].should =~ /log/i
      end
    end

    describe 'failure' do
      it 'should render new' do
        post :create
        response.should render_template :new
      end
    end
  end

  describe 'destroy' do
    it 'should clear session id' do
      post :destroy
      cookies[:auth_token].should be_nil
    end

    it 'should set the notice' do
      post :destroy
      flash[:notice].should =~ /out/i
    end
  end

end
