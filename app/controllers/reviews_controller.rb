class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_current_user
  before_action :find_item

  def show_form
    @review = @user.reviews.build

    render :new
  end

  def add_review
    @review = @user.reviews.new(reviews_params)
    @review.item_id = params[:id]

    if @review.save
      redirect_to user_profile_path(@user), notice: 'レビューを投稿しました'
    else
      render :new
    end
  end



  # private
  private
    def reviews_params
      params.require(:review).permit(:body, :star)
    end

    def find_current_user
      @user = User.find(current_user.id)
    end

    def find_item
      @item = Item.find(params[:id])
    end
end
