class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new params[:project]
    @project.user_id = current_user.id
    if @project.save
      redirect_to root_url, notice:
        'Project created.'
    else
      render :new
    end
  end

end
