require 'spec_helper'

describe "Notes" do

  before do
    @user = create :user
    login_as @user
    @project = create :project, user: @user
  end

  describe 'new' do
    before do
      visit project_path @project
    end

    it 'should create a new note', js: true do
      lambda do
        fill_in 'note_content', with: 'test'
        page.evaluate_script "document.forms[0].submit()"
      end.should change( Note, :count ).by 1
    end

    it 'should show the new note', js: true do
      fill_in 'note_content', with: 'test note'
      page.evaluate_script "document.forms[0].submit()"
      page.should have_content 'test note'
    end
  end

  describe 'index' do
    before do
      @notes = create_list :note, 15, user: @user, project: @project
      visit project_path @project
    end

    it 'should display the notes' do
      @notes.each do |note|
        page.should have_content note.content
      end
    end
  end

  describe 'edit', js: true do
    before do
      @note = create :note, user: @user, project: @project
      visit project_path @project
    end

    it 'should edit the note' do
      find( :css, "span#best_in_place_note_#{@note.id}_content" ).click
      bip_text @note, :content, 'updated content'
      page.should have_content 'updated content'
    end
  end

  describe 'completed', js: true do
    before do
      @note = create :note, user: @user, project: @project
      @completed_note = create :note, user: @user, project: @project, 
        completed_at: Time.now, content: 'completed note'
      visit project_path @project
    end

    it 'should mark the note as complete' do
      find( :css, 'input.checkbox' ).click
      find( :css, 'input.checkbox' ).click
      @note.reload
      @note.completed_at.should_not be_nil
    end

    it 'should display completed notes on button click' do
      find( :css, 'button.plus' ).click
      find( 'tr', text: @completed_note.content ).should be_visible
    end
  end

end
