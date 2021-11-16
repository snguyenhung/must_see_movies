class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :reviews,
             class_name: "Interact",
             dependent: :destroy

  # Indirect associations

  has_many   :movie_reviews,
             through: :reviews,
             source: :movie

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
