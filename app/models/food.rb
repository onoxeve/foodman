class Food < ApplicationRecord
  belongs_to :user, optional: true

  #validates :user_id, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  after_create_commit { FoodBroadcastJob.perform_later self }
end
