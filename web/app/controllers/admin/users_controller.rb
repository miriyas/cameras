class Admin::UsersController < ApplicationController

  before_filter :require_admin

	layout "admin"

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to admin_users_path, :notice => "Signed up!"
    else
      render :new
    end
  end
	
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_users_path
    else
      render action: 'edit'
    end
  end
	
	
  def index
 	  @users = User.search(params[:search]).page(params[:page]).per(20)
	end
	
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to admin_users_path
  end	
end