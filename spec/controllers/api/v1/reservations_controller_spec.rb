require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user, email: "sky100@gmail.com", password: "123456") }
  let(:valid_reservation_params) do
    {
      name: "dheeraj",
      email: "dkalwar@example.com",
      date: "2022-10-10T12:00:00.000Z",
      number_of_guests: "2",
      phone: "9762652345",
      user_id: user.id
    }
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      sign_in user
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      sign_in user
      reservation = create(:reservation, user: user)
      get :show, params: { id: reservation.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new reservation' do
        sign_in user
        expect {
          post :create, params: { reservation: valid_reservation_params }
        }.to change(Reservation, :count).by(1)
      end

      it 'returns a successful response' do
        sign_in user
        post :create, params: { reservation: valid_reservation_params }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { valid_reservation_params.merge(date: nil) }

      it 'does not create a new reservation' do
        expect {
          post :create, params: { reservation: invalid_attributes }
        }.to_not change(Reservation, :count)
      end
    end
  end

  describe 'GET #history' do
    it 'returns a successful response' do
      sign_in user
      get :history
      expect(response).to have_http_status(:ok)
    end
    
  end

  describe 'GET #upcoming' do
    it 'returns a successful response' do
      sign_in user
      get :upcoming
      expect(response).to have_http_status(:ok)
    end
  end
end
