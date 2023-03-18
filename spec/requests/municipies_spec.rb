require 'rails_helper'

RSpec.describe 'Municipies', type: :request do
  describe 'GET#index' do
    context 'when the municipies are listed' do
      let(:municipies) { create_list(:municipe, 2) }
      let(:address1) { create(:address, municipe_id: municipies.first.id) }
      let(:address2) { create(:address, municipe_id: municipies.second.id) }

      before do
        municipies
        address1
        address2

        get '/municipies'
      end

      it 'must return the 200 status code' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return the municipe attributes' do
        expect(json_body[0]).to include(:id, :full_name, :cpf, :cns, :email,
                                    :status, :address)
      end
    end
  end

  describe 'POST#create' do
    context 'when the municipe is created' do
      let(:address_attributes) { attributes_for(:address) }
      let(:municipe_attributes) { attributes_for(:municipe, address_attributes: address_attributes) }
  
      before do
        municipe_attributes
        address_attributes
  
        post '/municipies', params: { municipe: municipe_attributes }
      end
  
      it 'must return 201 status code' do
        expect(response).to have_http_status(201)
      end
  
      it 'must return the municipe attributes' do
        expect(json_body).to include(:id, :full_name, :cpf, :cns, :email,
                                     :status, :address)
      end
    end

    context 'when the municipe is not created' do
      let(:invalid_address_attributes) { attributes_for(:address, cep: nil, city: nil) }
      let(:invalid_municipe_attributes) { attributes_for(:municipe, full_name: nil,
                                                            address_attributes: invalid_address_attributes) }
  
      before do
        invalid_municipe_attributes
        invalid_address_attributes
  
        post '/municipies', params: { municipe: invalid_municipe_attributes }
      end
  
      it 'must return 422 status code' do
        expect(response).to have_http_status(422)
      end
  
      it 'must return the municipe errors' do
        expect(json_body).to include(:errors)
      end
    end
  end

  describe 'GET#show' do
    context 'when a municipe is selected' do
      let(:municipe) { create(:municipe) }
      let(:address) { create(:address, municipe_id: municipe.id) }

      before do
        municipe
        address

        get "/municipies/#{municipe.id}"
      end

      it 'must return show municipe' do
        expect(response).to have_http_status(:ok)
      end

      it 'must return municipe attributes' do
        expect(json_body).to include(:id, :full_name, :cpf, :cns, :email,
                                      :status, :address)
      end
    end
  end

  describe 'PUT#update' do
    context 'when a municipe is updated' do
      let(:municipe) { create(:municipe) }
      let(:address_attributes) { attributes_for(:address) }
      let(:municipe_attributes) { attributes_for(:municipe, address_attributes: address_attributes) }
  
      before do
        municipe
        municipe_attributes
        address_attributes
  
        put "/municipies/#{municipe.id}", params: { municipe: municipe_attributes }
      end

      it 'must return 204 status code' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when a municipe is not updated' do
      let(:municipe) { create(:municipe) }
      let(:invalid_address_attributes) { attributes_for(:address, cep: '', city: '') }
      let(:invalid_municipe_attributes) { attributes_for(:municipe, full_name: '',
                                                          address_attributes: invalid_address_attributes) }
  
      before do
        municipe
        invalid_municipe_attributes
        invalid_address_attributes
  
        put "/municipies/#{municipe.id}", params: { municipe: invalid_municipe_attributes }
      end

      it 'must return 422 status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return error messages' do
        expect(json_body).to include(:errors)
      end
    end
  end
end
