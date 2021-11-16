require "rails_helper"

RSpec.describe InteractResource, type: :resource do
  describe "serialization" do
    let!(:interact) { create(:interact) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(interact.id)
      expect(data.jsonapi_type).to eq("interacts")
    end
  end

  describe "filtering" do
    let!(:interact1) { create(:interact) }
    let!(:interact2) { create(:interact) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: interact2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([interact2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:interact1) { create(:interact) }
      let!(:interact2) { create(:interact) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      interact1.id,
                                      interact2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      interact2.id,
                                      interact1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
