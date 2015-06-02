class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json


  private

  def authenticated?
    authenticate_or_request_with_basic_http { |username, password| User.where(username: username, password: password).present? }
  end

end
