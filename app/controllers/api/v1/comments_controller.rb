class Api::V1::CommentsController < ActionController::API
  def index
    post = Post.find(params[:post_id])
    render json: post.comments
  end

 

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
