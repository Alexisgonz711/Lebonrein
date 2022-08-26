class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :organs

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
  validates :password, presence: true

  # Créer une méthode "average rating" relatif à un user
  # Je récupère le tableau de notes des reviews de tous ses organs (voir méthode dans le terminal)
  # J'en fais la moyenne
  # J'utilise cette méthode où j'ai besoin d'afficher cette moyenne

  def average_rating
    reviews = organs.map(&:review).compact
    return nil if reviews.empty?

    all_ratings = reviews.map(&:rating)
    all_ratings.sum.fdiv(all_ratings.count)
  end
end
