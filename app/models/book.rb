class Book < ApplicationRecord


  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :post_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def favorited_by?(user)
    favorites.exists?(user: user)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "body", "created_at",  "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["favorites", "post_comments", "user"]
  end

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    else
      return default_scope -> { order(created_at: :desc) }
    end
  end

end
