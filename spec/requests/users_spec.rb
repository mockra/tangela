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

  describe 'edit' do
    before do
      @user = create :user
      login_as @user
      visit edit_user_path @user
    end

    it 'should update user name' do
      fill_in 'user_name', with: 'Updated Name'
      click_button 'Submit'
      page.should have_content 'Updated Name'
    end
  end

end
