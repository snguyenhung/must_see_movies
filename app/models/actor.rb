class Actor < ApplicationRecord
  # Direct associations

  has_many   :characters,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dob
  end

end
