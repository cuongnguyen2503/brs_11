class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def index
    @user = User.find_by id: params[:id]
    show_type = params[:show_type]
    if show_type == "following" || show_type == "followers"
      @users = @user.send(show_type).paginate page: params[:page], per_page: 10
      @title = show_type.titleize
    else
      @users = []
      @title = ""
    end
  end

  def create
    user = User.find params[:followed_id]
    current_user.follow user
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow user
    redirect_to user
  end
end
