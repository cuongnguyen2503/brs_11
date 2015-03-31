class BooksController < ApplicationController

  def index
    @categories = Category.all.pluck(:name, :id).insert(0, ["All", 'all'])
    category = Category.find_by id: params[:category_id]
    @books = Book.at_category(category)
    @books = @books.title_like(params[:title]).author_like(params[:author])
    @books = @books.paginate page: params[:page], per_page: 50
  end

end
