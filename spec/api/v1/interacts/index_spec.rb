require 'rails_helper'

RSpec.describe "interacts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interacts", params: params
  end

  describe 'basic fetch' do
    let!(:interact1) { create(:interact) }
    let!(:interact2) { create(:interact) }

    it 'works' do
      expect(InteractResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['interacts'])
      expect(d.map(&:id)).to match_array([interact1.id, interact2.id])
    end
  end
end
