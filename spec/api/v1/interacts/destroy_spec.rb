require 'rails_helper'

RSpec.describe "interacts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/interacts/#{interact.id}"
  end

  describe 'basic destroy' do
    let!(:interact) { create(:interact) }

    it 'updates the resource' do
      expect(InteractResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Interact.count }.by(-1)
      expect { interact.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
