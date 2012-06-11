module Api
  module V1
    class NotesController < Api::BaseController

      doorkeeper_for :all
      respond_to :json, :xml
      before_filter :project

      def index
        respond_with project.notes.all
      end

      def show
        respond_with project.notes.find params[:id]
      end

      def create
        @note = project.notes.build params[:note]
        @note.user_id = current_user.id
        @note.save
        respond_with @note
      end

      def update
        respond_with project.notes.update params[:id], params[:note]
      end

      def destroy
        respond_with project.notes.destroy params[:id]
      end

    end

  end
end

