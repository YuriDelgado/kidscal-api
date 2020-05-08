class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    render json: @user if @user.save
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
