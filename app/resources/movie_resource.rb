class MovieResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :year, :date
  attribute :duration, :integer
  attribute :description, :string
  attribute :image, :string
  attribute :director_id, :integer

  # Direct associations

  belongs_to :director

  has_many   :reviews,
             resource: InteractResource

  has_many   :characters

  # Indirect associations

  many_to_many :actors

  many_to_many :user_reviews,
               resource: UserResource
end
