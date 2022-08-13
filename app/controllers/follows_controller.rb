class FollowsController < ApplicationController
  before_action :authenticate_user!

  def follow_user
    user = current_user
    follow = user.follows.new(follows_params)

    if follow.save
      redirect_to request.referer, notice: 'フォローしました'
    else
      render "users/profile"
    end
  end

  def unfollow_user
    user = current_user
    follower = user.follows.find_by(follower_id: params[:follower_id])
    follower.destroy

    redirect_to request.referer, notice: 'フォローを解除しました'
  end

  # private
  private
  def follows_params
    params.permit(:follower_id)
  end
end
