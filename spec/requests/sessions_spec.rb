require 'spec_helper'

describe "Sessions" do
  before do
    @user = create :user
  end

  describe 'new' do
    it 'should login the user' do
      login_as @user
      page.should have_content @user.name
    end
  end

  describe 'destroy', js: true do
    before do
      login_as @user
    end

    it 'should logout the user' do
      click_link @user.name
      click_link 'Log out'
      page.should_not have_content @user.name
    end
  end
end
