class Activity < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 200}

  scope :owned_by, ->(users_ids) {where(user_id: users_ids).order created_at: :desc}

  def liked_by? user
    likes.pluck(:user_id).include? user.id
  end
end
