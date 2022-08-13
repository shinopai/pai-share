class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_current_user

  def add_item
    item = Item.find(params[:id])
    @user.items << item
    redirect_to request.referer, notice: "お気に入りに追加しました"
  end

  def remove_item
    res = @user.favorites.find_by(params[:id])
    res.destroy
    redirect_to request.referer, notice: "お気に入りから外しました"
  end

  # private
  private
  def get_current_user
    @user = current_user
  end
end
