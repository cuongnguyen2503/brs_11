class Request < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {maximum: 100}
  validates :content, presence: true, length: {maximum: 300}

  def pending?
    solve == "pending"
  end
end
