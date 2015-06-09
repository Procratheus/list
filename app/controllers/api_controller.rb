class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticated?
  respond_to :json
  
  private

  def authenticated?
    authenticate_or_request_with_http_token do |token, options| 
      ApiKey.exists?(access_token: token)
      @token = token
    end
  end

  def current_user
    @current_user ||= ApiKey.find_by(access_token: @token).user
  end

end
