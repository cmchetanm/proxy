class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

    def current_url_without_parameters
      request.original_url.split('?').first
    end
end
