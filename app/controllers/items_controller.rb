class ItemsController < ApplicationController
  def index
    @items = Item.all.order(id: :desc).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
end
