class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build review_params
    @book = Book.find params[:review][:book_id]
    @review.save
      
    respond_to do |format|
      format.js
    end
  end

  def update
    @review = Review.find params[:id]
    @book = @review.book
    @review.update_attributes review_params

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @review = current_user.reviews.find params[:id]
    @book = @review.book
    @review.destroy if @review.present?
    respond_to do |format|
      format.js
    end
  end

  private

  def review_params
    params.require(:review).permit :book_id, :rating_point, :content
  end
end
