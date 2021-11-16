class Movie < ApplicationRecord
  # Direct associations

  belongs_to :director

  has_many   :reviews,
             :class_name => "Interact",
             :dependent => :destroy

  has_many   :characters,
             :dependent => :destroy

  # Indirect associations

  has_many   :user_reviews,
             :through => :reviews,
             :source => :user

  # Validations

  # Scopes

  def to_s
    title
  end

end
