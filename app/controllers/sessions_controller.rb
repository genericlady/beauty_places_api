class SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      auth_token = AuthToken.new({ user: auth_token_arguments(user) })
      authenticated_response = {user: user, token: auth_token.encode}

      render json: authenticated_response
    else
      render json: {errors: {message: "Could not find user"}}, status: 500
    end
  end

  private
  def auth_token_arguments(user)
    {
      username: user.username,
      email: user.email,
      id: user.id
    }
  end

end
