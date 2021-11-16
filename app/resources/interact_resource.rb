class InteractResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :rating, :integer
  attribute :review, :string
  attribute :movie_id, :integer
  attribute :bookmark, :string

  # Direct associations

  belongs_to :movie

  # Indirect associations

end
