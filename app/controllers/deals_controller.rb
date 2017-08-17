class DealsController < ApplicationController
  def index
    token = request.env["HTTP_AUTHORIZATION"]
    auth_token = AuthToken.new({ token: token })

    if auth_token.decode
      binding.pry
      render json: Deal.all
    else
      errors = { errors: { message: "You must provide a valid token!" } }
      render json: errors, status: 500
    end
  end
end
