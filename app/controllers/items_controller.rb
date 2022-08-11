class ItemsController < ApplicationController
  before_action :set_q_header, only: %i(show search)

  def index
    @items = Item.all.order(id: :desc).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def search
    @result = @q_header.result.page(params[:page])
    @search_word = params[:q]['name_or_description_gt']
  end
end
