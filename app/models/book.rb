class Book < ActiveRecord::Base
  belongs_to :category

  scope :at_category, -> category {where(category: category) if category}
  scope :title_like, -> title {where("title like ?", "%#{title}%")}
  scope :author_like, -> author {where("author like ?", "%#{author}%")}
end
