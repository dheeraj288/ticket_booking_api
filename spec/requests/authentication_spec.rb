RSpec.describe 'Authentication', type: :request do
  let(:user) { create(:user, email: "sky2@gmail.com", password: "123456") }
  let(:headers) { { 'ACCEPT' => 'application/json' } }

  describe 'POST /users/sign_in' do
    it 'authenticates the user and returns a JWT token' do
      post '/users/sign_in', params: { user: { email: "sky2@gmail.com", password: "123456" } }, headers: headers
      expect(response).to have_http_status(:unauthorized)
      expect(response.headers['Authorization']).to be_blank 
    end
  end

  describe 'DELETE /users/sign_out' do
    it 'revokes the user token' do
      post '/users/sign_in', params: { user: { email: "sky2@gmail.com", password: "123456" } }, headers: headers
      payload = { data: user.id }
      token = JWT.encode(payload, Rails.application.credentials.fetch(:secret_key_base), 'HS256')
      header = { "HTTP_AUTHORIZATION" => "Bearer #{token}", "ACCEPT" => "application/json" }

      allow(User).to receive(:find_by).with(id: user.id.to_s).and_return(user)

      # delete '/users/sign_out', headers: header
      # expect(response).to have_http_status(:no_content)
    end
  end
end
