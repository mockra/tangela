class ResourcesController < ApplicationController

  before_filter :authenticate
  before_filter :project, except: [ :sort ]

  def index
    @resources = @project.resources.all
  end

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
    @project.resources.find(params[:id]).destroy
    redirect_to @project
  end

  def sort
    params[:resource].each_with_index do | resource_id, index |
      Resource.update_all( { position: index }, { id: resource_id } )
    end
    render nothing: true
  end

end
