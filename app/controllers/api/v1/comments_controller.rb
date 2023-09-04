class Api::V1::CommentsController < ActionController::API
  before_action :set_user
  before_action :set_post
  before_action :set_comments

  def index
    pretty_json = JSON.pretty_generate(@comments.as_json)
    render json: pretty_json, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:post_id])
  end

  def set_comments
    @comments = @post.comments
  end
end
