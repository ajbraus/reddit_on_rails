class CommentsController < ApplicationController
  before_action :authorize

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to @post
    else
      redirect_to @post
      flash[:notice] = "Comment could not be saved."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
