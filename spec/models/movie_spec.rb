require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:director) }

    it { should have_many(:reviews) }

    it { should have_many(:characters) }
  end

  describe "InDirect Associations" do
    it { should have_many(:actors) }

    it { should have_many(:user_reviews) }
  end

  describe "Validations" do
  end
end
