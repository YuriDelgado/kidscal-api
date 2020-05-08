class AuthenticationController < ApplicationController
 skip_before_action :authorize_request

  def authenticate
    command = AuthenticateUser.call(user_params)

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end