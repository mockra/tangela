class ResourcesController < ApplicationController

  before_filter :authenticate, :project

  def new
    @resource = @project.resources.build
  end

  def create
    @resource = @project.resources.build params[:resource]
    @resource.user_id = current_user.id
    if @resource.save
      redirect_to @project, notice:
        'Resource created.'
    else
      render :new
    end
  end

  def destroy
    @project.resources.find( params[:id] ).destroy
    redirect_to @project
  end

  private

  def project
    @project = current_user.projects.find_by_id params[:project_id]
    redirect_to root_url if @project.nil?
  end

end
