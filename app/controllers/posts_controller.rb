class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # @user = current_user
    # @post = @user.posts.build
    @post = Post.new
  end

  def create
    @user = current_user
    @post = @user.posts.build(new_post_params)
    if @post.save
      flash[:success] = 'Your post has been published!'
      redirect_to @post
    else
      flash.now[:error] = 'There was an issue publishing your post. Please try again.'
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def new_post_params
    params.require(:post).permit(:content)
  end
end
