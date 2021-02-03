class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @friend_request = Friendship.new
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
