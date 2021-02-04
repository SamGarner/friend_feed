class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @connected_user_ids = Friendship.connections(@user.id)
    @stranger_ids = User.fetch_stranger_ids(@connected_user_ids)
    @all_users = User.all # adjust for scalability
    @friend_request = Friendship.new
  end

  def show
    @friend_ids = Friendship.friends(current_user.id)
    @user = User.find(params[:id])
    @connected_user_ids = Friendship.connections(current_user.id)
    @stranger_ids = User.fetch_stranger_ids(@connected_user_ids)
    @friend_request = Friendship.new
    @posts = Post.fetch_users_posts([@user.id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.avatar.attach(profile_picture_params[:avatar])
      flash[:notice] = 'Profile picture updated successfully.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Picture did not upload. Please try again.'
      render 'edit'
    end
  end

  private

  def profile_picture_params
    params.require(:user).permit(:avatar)
  end
end
