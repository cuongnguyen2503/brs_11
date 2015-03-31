class LikesController < ApplicationController
  def create
    @activity = Activity.find params[:activity_id]
    current_user.like_activity @activity
    respond_to do |format|
      format.html {redirect_to current_user}
      format.js
    end
  end

  def destroy
    @activity = Activity.find params[:activity_id]
    current_user.unlike_activity @activity
    respond_to do |format|
      format.html {redirect_to current_user}
      format.js
    end
  end
end
