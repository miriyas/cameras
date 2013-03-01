# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
			if user.admin?
     	 respond_to do |format|
      		format.html { redirect_to root_path, :notice => "Logged in as admin!" }
      	end
			else
	      flash.now.alert = "Admin only. You have no permission."
	      respond_to do |format|
	        format.html { redirect_to root_path, :notice => "Logged in!" }
	      end
			end
    else
      respond_to do |format|
        format.html { redirect_to root_path, :alert => "로그인 실패, 메일주소와 비밀번호를 다시 확인해주세요." }
      end
    end
	end
			
	def destroy
	  logout
	  redirect_to root_url
	end
end