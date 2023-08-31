class UsersController < ApplicationController

  before_action :authenticate_user!

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
end
