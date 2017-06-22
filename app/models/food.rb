class Food < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  before_destroy :clean_s3

  validates :user_id, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  after_create_commit { FoodBroadcastJob.perform_later self }

  private

  def clean_s3
    image.remove!
    image.thumb.remove!
  end
end
