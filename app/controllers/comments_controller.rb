class CommentsController < ApplicationController
  # before_action :authenticate_user!
  # load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    Rails.logger.debug(params.inspect)
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id),
                  notice: 'Comment has been added successfully.'
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_back_or_to root_path
  end

  private

  def comment_params
    params.permit(:text)
  end
end
