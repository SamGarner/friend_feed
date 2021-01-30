class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  validates :email, :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :trackable # non-default modeuls

  has_many :posts
  has_many :sent_requests, foreign_key: 'sender_id', class_name: 'FriendRequest'
  has_many :received_requests, foreign_key: 'receiver_id', class_name: 'FriendRequest'
  has_many :sent_friendships, foreign_key: 'sender_id', class_name: 'Friendship'
  has_many :received_friendships, foreign_key: 'receiver_id', class_name: 'Friendship'
end
