class UsersController < ApplicationController
  # before_action :authenticate_user!
  # load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end

  # private

  # def set_user
  # @user = User.find(params[:id])
  # end

  def logout
    sign_out current_user
    redirect_to root_path
  end
end
