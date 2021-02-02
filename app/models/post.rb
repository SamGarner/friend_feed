class Post < ApplicationRecord
  validates :content, :user_id, presence: true

  belongs_to :user

  # private

  def self.fetch_users_posts(user_ids)
    timeline_posts = []
    user_ids.each do |user_id|
      timeline_posts << Post.where('user_id = ?', user_id)
    end
    timeline_posts.flatten
  end
end
