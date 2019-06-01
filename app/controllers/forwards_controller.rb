class ForwardsController < ApplicationController
  before_action :ensure_proxy

  def create
    ping = Ping.new(ping_params)
    if ping.save
      redirect_to ENV['FORWARD_TO_URL'] + "?#{query_params.to_query}"
    else
      ping.ping_errors = ping.errors.messages
      ping.save(:validate => false)
      redirect_to ENV['FORWARD_TO_URL'] + "?#{query_params.to_query}"
    end
  end

  private

    def ping_params
      params.permit(:app_id).merge({query_params: query_params, ping_type: params[:type], original_url: current_url_without_parameters})
    end

    def query_params
      params.except(:controller, :action).to_unsafe_h
    end

    def ensure_proxy
      return if params[:proxy] == 'true'
      redirect_to ENV['FORWARD_TO_URL'] and return
    end
end
