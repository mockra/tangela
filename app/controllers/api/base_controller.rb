class Api::BaseController < ApplicationController

  private

    def current_user
      @current_user ||= User.find doorkeeper_token.resource_owner_id
    end

    def project
      @project = current_user.projects.find_by_id params[:project_id]
    end

end
