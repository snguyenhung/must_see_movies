class Actor < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :characters,
             :dependent => :destroy

  # Indirect associations

  has_many   :movies,
             :through => :characters,
             :source => :movie

  # Validations

  # Scopes

  def to_s
    dob
  end

end
