require 'rails_helper'

describe 'Reservations API', type: :request do
	 describe 'GET /reservations' do
	it 'returns all reservations' do
		# FactoryBot.create(:reservation, name: 'Ravi', email: "ravi@example.com", number_of_guests: "2", phone: "9746465994", date: "09-10-2023T10:00:00",user_id: 2)
		# FactoryBot.create(:reservation, name: 'Marks', email: "mark@example.com", number_of_guests: "4", phone: "8846465994", date: "07-11-2023T09:10:00",user_id: 2)
		
		get '/api/v1/reservations'


		expect(response).to have_http_status(:success)
		# expect(JSON.parse(response.body).size).to eq(2)
	 end
  end

  describe 'POST /reservations' do
  	it 'create a new reservation' do
  		post '/api/v1/reservations', params: {reservation: {name: 'KGF', email: 'kg@example.com', number_of_guests: '3', phone: '79646164666', date: '10-12-2022T10:00', user_id: 4} }
  		expect(response).to have_http_status(:created)
  	end
  end
end

