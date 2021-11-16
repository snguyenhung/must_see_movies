class Interact < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :movie

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
