class CharacterResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :actor_id, :integer
  attribute :movie_id, :integer

  # Direct associations

  # Indirect associations

end
