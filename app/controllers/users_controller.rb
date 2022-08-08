class UsersController < ApplicationController
  before_action :authenticate_user!

  def get_profile
    @user = User.find(params[:id])

    render :profile
  end
end
