class CategoriesController < ApplicationController
  def get_list
    @category = Category.find(params[:id])

    render :list
  end
end
