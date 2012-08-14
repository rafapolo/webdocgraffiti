class ApplicationController < ActionController::Base
  protect_from_forgery

  def login
		authenticate_or_request_with_http_basic do |user_name, password|
      		user_name == "*webdocadmin*" && password == "*webdocsenha*"
    	end
  end

end
