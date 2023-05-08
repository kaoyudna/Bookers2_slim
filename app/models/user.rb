class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  has_many :relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :relationships, source: :follower
  has_many :reverce_of_relationships, class_name: 'Relationships', foreign_key: 'follower_id', dependent: :destroy
  has_many :followings, through: :reverce_of_relationships, source: :followed

  has_one_attached :profile_image

  validates :name, presence: true
  validates :introduction, length: { maximum: 20 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end
  
  def self.follow(user)
    current_user.followings.create(follower_id: user.id)
  end
  
end
