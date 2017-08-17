class UsersController < ApplicationController
  def signup
    user = User.new(user_params)
    if user.save
      # when signup is successful return the encoded user
      render json: user
    else
      render json: {errors: user.errors.full_messages}, status: 500
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
