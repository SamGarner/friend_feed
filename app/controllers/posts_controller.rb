class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def new
    # @user = current_user
    # @post = @user.posts.build
    @post = Post.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
