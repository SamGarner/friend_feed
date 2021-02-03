class Post < ApplicationRecord
  validates :content, :user_id, presence: true

  belongs_to :user
  has_many :likes, as: :likable
  has_many :comments, as: :commentable

  # private

  def self.fetch_users_posts(user_ids)
    timeline_posts = []
    user_ids.each do |user_id|
      timeline_posts << Post.where('user_id = ?', user_id)
    end
    timeline_posts.flatten.sort_by(&:created_at).reverse!
  end
end
