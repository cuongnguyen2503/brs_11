class User < ActiveRecord::Base
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :read_statuses, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_books, through: :favorites, source: :book
  has_many :reviews, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {maximum: 30}

  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    following.include? other_user
  end

  def is_admin_user?
    admin?
  end

  def feed
    followed_ids = Relationship.followed_of(id).pluck :followed_id
    users_ids = followed_ids.push id
    Activity.owned_by users_ids
  end

  def like_activity activity
    likes.create user_id: id, activity_id: activity.id
  end

  def unlike_activity activity
    likes.find_by(user_id: id, activity_id: activity.id).destroy
  end

  def favorite_book book
    favorites.create user_id: id, book_id: book.id
  end

  def remove_favorite favorite
    favorites.find_by(id: favorite.id).destroy
  end

  def favorite? book
    book_ids = favorites.pluck :book_id
    book_ids.include? book.id
  end

  def favorite_of book
    favorite_list = favorites.where book_id: book.id
    favorite_list.first
  end
end
