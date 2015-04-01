class ReadStatusesController < ApplicationController

  def create
    @read_status = ReadStatus.create status_params
    if @read_status.save
      redirect_to book_path params[:book_id]
    else
      redirect_to books_path
    end
  end

  private

  def status_params
    params.permit :user_id, :book_id, :status
  end

end
