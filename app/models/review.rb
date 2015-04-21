class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :rating_point, presence: true, numericality: {greater_than: 0, less_than_or_equal_to: 10}
end
