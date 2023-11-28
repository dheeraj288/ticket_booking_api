# require 'rails_helper'
# require 'jwt'

# RSpec.describe 'Authentication', type: :request do
#   let(:user) { create(:user, email: "sky2@gmail.com", password: "123456") }
#   let(:headers) { { 'ACCEPT' => 'application/json' } }

#   describe 'POST /users/sign_in' do
#     it 'authenticates the user and returns a JWT token' do
#       post '/users/sign_in', params: { user: { email: "sky@gmail.com", password: "123456" } }, headers: headers
#       expect(response).to have_http_status(:ok)
#       expect(response.headers['Authorization']).to be_present
#     end
#   end

#   describe 'DELETE /users/sign_out' do
#     it 'revokes the user token' do
#       # Sign in the user
#       post '/users/sign_in', params: { user: { email: "sky@gmail.com", password: "123456" } }, headers: headers
#       expect(response).to have_http_status(:ok)

#       # Extract the token from the response
#       token = response.headers['Authorization'].split(' ').first

#       # Make sure the token is present
#       expect(token).to be_present

#       # Attempt to revoke the token
#       delete '/users/sign_out', headers: { 'Authorization' => "Bearer #{token}", 'ACCEPT' => 'application/json' }

#       # Expect the response to have a no_content status
#       expect(response).to have_http_status(:no_content)
#     end
#   end
# end




require 'rails_helper'
require 'jwt'

RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user, email: "sky2@gmail.com", password: "123456") }
  let(:headers) { { 'ACCEPT' => 'application/json' } }

  describe 'POST /users/sign_in' do
    it 'authenticates the user and returns a JWT token' do
      post '/users/sign_in', params: { user: { email: "sky@gmail.com", password: "123456" } }, headers: headers
      expect(response).to have_http_status(:ok)
      expect(response.headers['Authorization']).to be_present
    end
  end

  describe 'DELETE /users/sign_out' do
    it 'revokes the user token' do
      post '/users/sign_in', params: { user: { email: "sky@gmail.com", password: "123456" } }, headers: headers
      payload = { data: user.id }
      token = JWT.encode(payload, nil, 'none')
      header = {"Authorization": "Bearer #{token}", "Accept": "application/json"}
      request.headers.merge!(header)
      delete '/users/sign_out'
      expect(response).to have_http_status(:no_content)
    end
  end
end


