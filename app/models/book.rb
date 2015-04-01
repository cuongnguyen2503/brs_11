class Book < ActiveRecord::Base
  belongs_to :category

  has_many :read_statuses, dependent: :destroy

  scope :at_category, -> category {where(category: category) if category}
  scope :title_like, -> title {where("title like ?", "%#{title}%")}
  scope :author_like, -> author {where("author like ?", "%#{author}%")}
end
