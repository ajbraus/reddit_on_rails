class VotesController < ApplicationController
  def create
    post = Post.find(params[:voted_post_id])

    current_user.votes.create(post_id: post.id)

    redirect_to root_path
  end
end
