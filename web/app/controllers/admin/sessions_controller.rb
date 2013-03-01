class Admin::SessionsController < ApplicationController

	layout "admin"

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
			if user.admin?
     	 respond_to do |format|
      		format.html { redirect_to admin_root_path, :notice => "Logged in!" }
      	end
			else
	      flash.now.alert = "Admin only. You have no permission."
	      respond_to do |format|
	        format.html { render :new }
	        # format.json { render json: user }
	      end
			end
    else
      flash.now.alert = "Double check your Email or password."
      respond_to do |format|
        format.html { render :new }
      end
    end
	end
			
	def destroy
	  logout
	  redirect_to root_url, :notice => "Logged out!"
	end
end