class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def get_list
    @category = Category.find(params[:id])

    render :list
  end
end
