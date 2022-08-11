class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def add_item
    user = current_user
    item = Item.find(params[:id])
    user.items << item
    redirect_to request.referer, notice: "お気に入りに追加しました"
  end

  def remove_item
    user = current_user
    res = user.favorites.find_by(params[:id])
    res.destroy
    redirect_to request.referer, notice: "お気に入りから外しました"
  end
end
