class ProjectsController < ApplicationController

  before_filter :project, except: [ :index, :new, :create ]
  before_filter :authenticate

  def index
    @projects = current_user.projects.all
  end

  def show
    @resources = @project.resources.order 'position'
    @resource = @project.resources.build
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build params[:project]
    if @project.save
      redirect_to projects_url, notice:
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
