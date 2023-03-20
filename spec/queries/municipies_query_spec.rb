require 'rails_helper'

RSpec.describe 'MunicipiesQuery', type: :query do
  context 'when have a filter' do
    context 'by full_name' do
      let(:params) { { full_name: 'full_name1' } }
      let(:municipe1) { create(:municipe, full_name: 'full_name1') }
      let(:municipe2) { create(:municipe, full_name: 'full_name2') }
      let(:address1) { create(:address, municipe_id: municipe1.id) }
      let(:address2) { create(:address, municipe_id: municipe2.id) }

      before do
        municipe1
        municipe2
        address1
        address2

        @municipies = MunicipiesQuery.new(params).call
      end

      it 'must return the municipe attributes' do
        expect(@municipies[0][:full_name]).to eq('full_name1')
      end
    end

    context 'by email' do
      let(:params) { { email: 'MyString1@email.com' } }
      let(:municipe1) { create(:municipe, full_name: 'full_name1', email: 'MyString1@email.com') }
      let(:municipe2) { create(:municipe, full_name: 'full_name2', email: 'MyString2@email.com') }
      let(:address1) { create(:address, municipe_id: municipe1.id) }
      let(:address2) { create(:address, municipe_id: municipe2.id) }

      before do
        municipe1
        municipe2
        address1
        address2

        @municipies = MunicipiesQuery.new(params).call
      end

      it 'must return the municipe attributes' do
        expect(@municipies[0][:full_name]).to eq('full_name1')
      end
    end

    context 'by address' do
      let(:params) { { address: 'public_place1' } }
      let(:municipe1) { create(:municipe, full_name: 'full_name1') }
      let(:municipe2) { create(:municipe, full_name: 'full_name2') }
      let(:address1) { create(:address, public_place: 'public_place1',
                                        municipe_id: municipe1.id) }
      let(:address2) { create(:address, public_place: 'public_place2',
                                        municipe_id: municipe2.id) }

      before do
        municipe1
        municipe2
        address1
        address2

        @municipies = MunicipiesQuery.new(params).call

      end

      it 'must return the municipe attributes' do
        expect(@municipies[0][:full_name]).to eq('full_name1')
      end
    end
  end
end