class PostsController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to root_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :url)
    end
end
