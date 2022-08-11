class ApplicationController < ActionController::Base
  before_action :set_q_header

  def set_q_header
    @q_header = Item.ransack(params[:q])
  end
  # before_action :require_login

  # private
  # def not_authenticated
  #   flash[:info] = 'ログインしてください'
  #   redirect_to main_app.login_path #main_appのプレフィックスをつける
  # end
end
