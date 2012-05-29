class NotesController < ApplicationController

  before_filter :authenticate, :project
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
    @project.notes.find(params[:id]).destroy
    redirect_to @project
  end

end
