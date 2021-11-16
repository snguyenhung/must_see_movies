require 'rails_helper'

RSpec.describe "interacts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interacts/#{interact.id}", params: params
  end

  describe 'basic fetch' do
    let!(:interact) { create(:interact) }

    it 'works' do
      expect(InteractResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('interacts')
      expect(d.id).to eq(interact.id)
    end
  end
end
