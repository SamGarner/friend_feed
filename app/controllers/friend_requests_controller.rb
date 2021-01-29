class FriendRequestsController < ApplicationController
  def create
    @new_request = FriendRequest.new(friend_request_params)
    if @new_request.save
      flash.now[:success] = 'Friend request sent!'
    else
      flash.now[:failure] = 'Error - Please try again'
      @friend_request = FriendRequest.new
    end
    @user = User.find(params[:friend_request][:receiver_id])
    render 'users/show'
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id)
  end
end
