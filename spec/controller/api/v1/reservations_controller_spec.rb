require 'rails_helper'

RSpec.describe Api::V1::ReservationsController type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let(:reservation) { create(:reservation) }

    it 'returns a successful response' do
      get :show, params: { id: reservation.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { reservation: attributes_for(:reservation) } }
    let(:invalid_params) { { reservation: attributes_for(:reservation, date: nil) }

    it 'creates a new reservation with valid params' do
      post :create, params: valid_params
      expect(response).to have_http_status(:ok)
    end

    it 'returns unprocessable_entity with invalid params' do
      post :create, params: invalid_params
      expect(response).to have_http_status(:unprocessable_entity)
    end

  describe 'GET #history' do
    it 'returns a successful response' do
      get :history
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #upcoming' do
    it 'returns a successful response' do
      get :upcoming
      expect(response).to have_http_status(:ok)
    end
  end
