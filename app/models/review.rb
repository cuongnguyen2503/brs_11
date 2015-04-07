class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :content, presence: true, length: {minimum: 15}
end
