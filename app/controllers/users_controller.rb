class UsersController < ApplicationController
  before_action :logged_in_user

  def index
    @users = User.all.paginate page: params[:page], per_page: 10
  end

  def show
    @user = User.find params[:id]
    render_show params[:show_type]
  end

  private

  def render_show show_type
    if show_type == "following" || show_type == "followers"
      @users = @user.send(show_type).paginate page: params[:page], per_page: 10
      render show_type
    else
      render 'show'
    end
  end
end
