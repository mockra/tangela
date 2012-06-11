module Api
  module V1

    class ProjectsController < Api::BaseController

      doorkeeper_for :all
      respond_to :json

      def index
        respond_with current_user.projects.all
      end

      def show
        respond_with current_user.projects.find params[:id]
      end

      def create
        @project = Project.new params[:project]
        @project.user_id = current_user.id
        @project.save
        respond_with @project
      end

      def update
        respond_with current_user.projects.update params[:id], params[:project]
      end

      def destroy
        respond_with current_user.projects.destroy params[:id]
      end

    end

  end
end
