class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :destroy]

  def create
    @comment = current_user.comments.build comment_params
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment = Comment.find params[:id]
    @comment.update_attributes comment_params
    @comment.save
    respond_to do |format|
      format.js
    end
  end  

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end  

  private

  def comment_params
    params.require(:comment).permit :user_id, :review_id, :content
  end
end
