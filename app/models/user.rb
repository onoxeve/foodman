class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  before_save { self.name.downcase! }
  validates :name, presence: true, length: { maximum: 15 }, uniqueness: { case_sensitive: false }, format: { with: /\A[a-z0-9]+\z/i, message: "is must NOT contain any other characters than alphanumerics." }
  #validates :email, presence: true, length: { maximum: 255 }, 
  #                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
  #                  uniqueness: { case_sensitive: false }
  #has_secure_password
  has_many :foods
  has_many :likes
  has_many :like_foods, through: :likes, source: :food

  # URLを/:usernameに変更
  def to_param
    name
  end

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

  # For Dvise
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
