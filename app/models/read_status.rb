class ReadStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true
  validates :book_id, presence: true

  scope :latest, -> (user_id, book_id) {where(user_id: user_id, book_id: book_id).order('created_at DESC')}

end
