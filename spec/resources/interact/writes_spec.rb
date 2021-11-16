require 'rails_helper'

RSpec.describe InteractResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'interacts',
          attributes: { }
        }
      }
    end

    let(:instance) do
      InteractResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Interact.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:interact) { create(:interact) }

    let(:payload) do
      {
        data: {
          id: interact.id.to_s,
          type: 'interacts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      InteractResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { interact.reload.updated_at }
      # .and change { interact.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:interact) { create(:interact) }

    let(:instance) do
      InteractResource.find(id: interact.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Interact.count }.by(-1)
    end
  end
end
