class Comment < ApplicationRecord
  validates :user_id, :commentable, :content, presence: true

  belongs_to :user
  belongs_to :commentable, polymorphic: true
end
