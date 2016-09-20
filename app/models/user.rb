class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :user_name, uniqueness: true

  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent:  :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:  :destroy
  has_many :followers, through: :passive_relationships

  belongs_to :gym, optional: true

  # Start following a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user you are currently following.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user, else false.
  def following?(other_user)
    following.include?(other_user)
  end

end
