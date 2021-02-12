class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :omniauthable
  require 'open-uri'

  validates :email, :name, presence: true # must receive these values from any OmniAuth provider or remove validation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable, :trackable, # non-default modules
         :omniauthable, omniauth_providers: [:facebook]

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :sent_requests, foreign_key: 'sender_id', class_name: 'FriendRequest'
  # has_many :received_requests, foreign_key: 'receiver_id', class_name: 'FriendRequest'
  has_many :sent_friendships, foreign_key: 'sender_id', class_name: 'Friendship', dependent: :destroy
  has_many :received_friendships, foreign_key: 'receiver_id', class_name: 'Friendship', dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_one_attached :avatar

  after_create :send_welcome_email

  def self.fetch_stranger_ids(connected_user_ids)
    User.where.not(id: connected_user_ids).map(&:id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.username = auth.info.name
      user.password = Devise.friendly_token[0,20]
      # user.avatar = auth.info.picture
              # unless user.avatar.attached? #(auth.info.picture)
                # downloaded_image = URI.open(auth.info.picture)

                #upload
                # user.avatar.attach(io: downloaded_image, filename: 'picture.jpg', content_type: downloaded_image.content_type)
              # end

      # if auth.info.picture
      #   downloaded_image = URI.open(auth.info.picture)
      #   user.avatar.attach(io: downloaded_image,
      #                      filename: "image-#{Time.now.strftime("%s%L")}",
      #                      content_type: downloaded_image.content_type)
      # end

      if auth.info.image
        downloaded_image = URI.open(auth.info.image)
        user.avatar.attach(io: downloaded_image, filename: 'image.jpg', content_type: downloaded_image.content_type)
      end
    end

      # if user.avatar.attached?
      # else
      #   # open the link
      #   downloaded_image = open(auth.info.image)

      #   # upload via ActiveStorage
      #   # be careful here! the type may be png or other type!
      #   user.avatar.attach(io: downloaded_image, filename: 'image.jpg', content_type: downloaded_image.content_type)
      # end
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider = auth.provider 
  #     user.uid      = auth.uid
  #     user.name     = auth.info.name
  #     user.save
  #   end
  # end

      #   from_omniauth(auth)
      # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # user.email = auth.info.email
      # user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
end
