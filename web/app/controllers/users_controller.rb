# encoding: utf-8
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "가입성공"
    else
      redirect_to root_url, :notice => "입력값을 다시 확인해주세요."
    end
  end
end