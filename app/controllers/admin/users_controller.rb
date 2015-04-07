class Admin::UsersController < ApplicationController

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = "User deleted!"
    redirect_to users_path
  end

end
