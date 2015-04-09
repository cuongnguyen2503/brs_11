class Admin::RequestsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def index
    @requests = Request.all.order created_at: :desc
    @requests = @requests.paginate page: params[:page], per_page: 20
  end

  def show
    @request = Request.find params[:id]
  end

  def update
    @request = Request.find params[:id]
    @request.update_attributes solve_param

    respond_to do |format|
      format.html {redirect_to admin_request_path @request}
      format.js
    end
  end

  private

  def admin_user
    redirect_to root_url unless current_user.is_admin_user?
  end

  def solve_param
    params.permit :solve
  end
end
