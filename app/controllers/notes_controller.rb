class NotesController < ApplicationController

  before_filter :authenticate
  before_filter :project, except: [ :sort ]
  respond_to :html, :json, :js

  def new
    @note = @project.notes.build
  end

  def create
    @note = @project.notes.build params[:note]
    @note.user_id = current_user.id

    if @note.save
      respond_to do |format|
        format.html { redirect_to @project }
        format.js { render layout: false }
      end
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
    @note = @project.notes.find params[:id]
    @note.destroy
    @notes = @project.notes.order 'position'

    respond_to do |format|
      format.html { redirect_to @project }
      format.js { render layout: false }
    end
  end

  def sort
    params[:note].each_with_index do | note_id, index |
      Note.update_all( { position: index }, { id: note_id } )
    end
    render nothing: true
  end

end
