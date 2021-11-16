require "rails_helper"

RSpec.describe "interacts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/interacts/#{interact.id}", payload
  end

  describe "basic update" do
    let!(:interact) { create(:interact) }

    let(:payload) do
      {
        data: {
          id: interact.id.to_s,
          type: "interacts",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(InteractResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { interact.reload.attributes }
    end
  end
end
