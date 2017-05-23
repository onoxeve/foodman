class Food < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :user_id, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  after_create_commit { FoodBroadcastJob.perform_later self }
end
