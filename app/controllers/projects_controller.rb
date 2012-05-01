class ProjectsController < ApplicationController

  before_filter :project, except: [ :index, :new, :create ]
  before_filter :authenticate

  def index
    @projects = current_user.projects.all
  end

  def show
  end

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

  def destroy
    @project.destroy
    redirect_to projects_url, notice:
      'Projected deleted.'
  end

  private

  def project
    @project = current_user.projects.find_by_id params[:id]
    redirect_to root_url if @project.nil?
  end

end
