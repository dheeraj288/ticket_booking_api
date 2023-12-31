class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options={})
    render json: {
      status: {code: 200, message: "User signed in sucessfully", data: current_user}
    },status: :ok
  end

  def respond_to_on_destroy
    # binding.pry
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
     Rails.application.credentials.fetch(:secret_key_base)).first
     current_user = User.find(id: jwt_payload['sub'].to_i)
    if current_user
      render json: {
        status: 200,
        message: "Signed out sucessfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "User has active session"
      }, status: :unauthorized
    end
  end
end
