class FavoritesController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @favorite_books = @user.favorite_books.order created_at: :desc
    @favorite_books = @favorite_books.paginate page: params[:page], per_page: 20
  end

  def create
    @book = Book.find params[:book_id]
    current_user.favorite_book @book
    respond_to do |format|
      format.html {redirect_to book_path @book}
      format.js
    end
  end

  def destroy
    @favorite = Favorite.find params[:id]
    @book = @favorite.book
    current_user.remove_favorite @favorite
    respond_to do |format|
      format.html {redirect_to book_path @book}
      format.js
    end
  end
end
