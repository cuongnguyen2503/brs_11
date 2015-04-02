class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @feed = current_user.feed.paginate page: params[:page], per_page: 20
    end
  end

  def help
  end

  def about
  end
end
