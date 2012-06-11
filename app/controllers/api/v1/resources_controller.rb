module Api
  module V1

    class ResourcesController < Api::BaseController

      doorkeeper_for :all
      respond_to :json
      before_filter :project

      def index
        respond_with project.resources.all
      end

      def show
        respond_with project.resources.find params[:id]
      end

      def create
        @resource = project.resources.build params[:resource]
        @resource.user_id = current_user.id
        @resource.save
        respond_with @resource
      end

      def update
        respond_with project.resources.update params[:id], params[:note]
      end

      def destroy
        respond_with project.resources.destroy params[:id]
      end

    end

  end
end


