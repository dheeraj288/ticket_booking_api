require 'rails_helper'

RSpec.describe Admin::ReservationsController, type: :controller do
  let(:admin_user) { create(:admin_user) }

  before do
    sign_in(admin_user)
  end

  describe 'GET index' do
    it 'displays the reservation details' do
      reservation = create(:reservation)

      get :index

      expect(response).to have_http_status(:success)
      expect(assigns(:reservations)).to include(reservation)
    end
  end
  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates a new reservation' do
      post :create, params: { reservation: { date: '2023-12-01', number_of_guests: 2, phone: '123-456-7890', name: 'John Doe', email: 'john@example.com', user_id: 1 } }
      # expect(response).to redirect_to(admin_reservations_path)
    end
  end
end