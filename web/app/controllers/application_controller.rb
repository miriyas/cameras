# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
	
	before_filter :set_locale
	
	def set_locale
		request.env['HTTP_ACCEPT_LANGUAGE']
		Time.zone = "Yakutsk"
	end
	
  def redirect_to_back_or_default(default_path)
    redirect_to params[:referer_url] || default_path
  end
	
  # admin
  def require_admin
    unless admin_logged_in?
      redirect_to admin_login_path
    end
  end
	
  def admin_logged_in?
    current_user && current_user.admin?
  end
end
