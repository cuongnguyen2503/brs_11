class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_activities, only: [:show]

  def index
    @users = User.all.paginate page: params[:page], per_page: 10
  end

  def show
  end

  private

  def load_activities
    @user = User.find params[:id]
    if current_user == @user || current_user.following?(@user)
      @activities = @user.activities.order(created_at: :desc)
                                    .paginate page: params[:page], per_page: 20
    else
      @activities = []
    end
  end
end
