class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :foods
  has_many :likes
  has_many :like_foods, through: :likes, source: :food

  # URLを/:usernameに変更
  def to_param
    name
  end

  # いいね機能
  def like(food)
    self.likes.find_or_create_by(food_id: food.id)
  end

  def unlike(food)
    like = self.likes.find_by(food_id: food.id)
    like.destroy if like
  end

  def like?(food)
    self.like_foods.include?(food)
  end

end
