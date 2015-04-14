class FavoritesController < ApplicationController
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
