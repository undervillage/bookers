class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :book_comments, dependent: :destroy

  has_one_attached :profile_image

  has_many :favorites
  has_many :favorite_books, through: :favorites, source: :book

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followings, through: :follower, source: :followed
  has_many :followers, through: :followed, source: :follower

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
 
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

  def follow(other_user)
    unless self == other_user
      follower.create(followed_id: other_user.id)
    end
  end

  def unfollow(other_user)
    follower.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    p 1

    p followings.include?(other_user)
    followings.include?(other_user)
  end
end
