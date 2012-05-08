class NotesController < ApplicationController

  before_filter :authenticate, :project
  respond_to :html, :json

  def new
    @note = @project.notes.build
  end

  def create
    @note = @project.notes.build params[:note]
    @note.user_id = current_user.id
    if @note.save
      redirect_to @project, notice:
        'Note created.'
    else
      render :new
    end
  end

  def update
    @note = @project.notes.find params[:id]
    @note.update_attributes params[:note]
    respond_with @note
  end

  def destroy
    @project.notes.find(params[:id]).destroy
    redirect_to @project, notice:
      'Note deleted.'
  end

end
