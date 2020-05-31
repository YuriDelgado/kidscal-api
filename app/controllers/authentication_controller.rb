class AuthenticationController < ApplicationController
 skip_before_action :authorize_request

  def authenticate
    command = AuthenticateUser.call(user_params[:email], user_params[:password])
    username = 
    if command.success?
      render json: { auth_token: command.result, display_name: display_name }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def display_name
    user = User.find_by(email: user_params[:email])
    user.profile.name
  end
end