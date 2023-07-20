class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:show]

  def index
    @posts = @user.posts
  end

  def show
    @comments = @post.comments
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post created successfully'

    else
      render html 'Error'
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = @user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
