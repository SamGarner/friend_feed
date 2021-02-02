class Like < ApplicationRecord
  validates :user, :likable, presence: true

  belongs_to :user
  belongs_to :likable, polymorphic: true
end
