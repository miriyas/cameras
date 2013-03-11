class CommentsController < ApplicationController

  def index
		@comments = Comment.all
  end
	
  def create
    @comment = Comment.new(params[:comment])
		@comment.user_ip = request.remote_ip
		if logged_in?
    	@comment.user = current_user
		end

		@comment.save
		redirect_to_back_or_default root_path
  end
	
  def update
    @comment = current_user.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to root_path, notice: 'Comment was successfully updated.' }
        format.json { render action: 'show', handlers: :jbuilder }
      else
        format.html { render action: "edit" }
        format.json { render json: '', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end