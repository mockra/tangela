require 'spec_helper'

describe "Users" do

  describe 'new' do
    it 'should create a new user' do
      lambda do
        visit new_user_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_name', with: 'Stark'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'Register'
      end.should change( User, :count ).by 1
    end
  end

end
