class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @new_request = Friendship.new(friend_request_params)
    if @new_request.save
      flash[:success] = 'Friend request sent!'
      redirect_to friendship_path
    else
      flash.now[:failure] = 'Error - Please try again'
      @friend_request = Friendship.new
      @user = User.find(params[:friend_request][:receiver_id])
      render 'users/show'
    end
  end

  private

  def accepted_request_params
    params.require(:friendship).permit(:sender_id, :receiver_id, :button)
  end

  def friend_request_params
    params.require(:friendship).permit(:sender_id, :receiver_id)
  end
end
