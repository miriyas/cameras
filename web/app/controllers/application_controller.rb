class ApplicationController < ActionController::Base
  protect_from_forgery
	
  def redirect_to_back_or_default(default_path)
    redirect_to params[:referer_url] || default_path
  end
	
end
