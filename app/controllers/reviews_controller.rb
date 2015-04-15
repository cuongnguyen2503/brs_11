class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create 
    @book = Book.find params[:book_id]
    @review = current_user.reviews.create review_params
    @review.book_id = @book.id
    if @review.save
      flash[:success] = "Your review posted"
      redirect_to book_path(@book)
    else
      flash[:alert] = "Your review unsuccessful"
      redirect_to book_path(@book)
    end
  end

  private
    def review_params
      params.require(:review).permit :user_id, :book_id, :content, :rating_point
    end 
end
