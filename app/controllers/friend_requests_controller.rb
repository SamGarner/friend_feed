class FriendRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @requests_sent = FriendRequest.pending_sent_requests(@current_user.id)
  end

  def create
    @new_request = FriendRequest.new(friend_request_params)
    if @new_request.save
      flash[:success] = 'Friend request sent!'
      redirect_to friend_requests_path
    else
      flash.now[:failure] = 'Error - Please try again'
      @friend_request = FriendRequest.new
      @user = User.find(params[:friend_request][:receiver_id])
      render 'users/show'
    end
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id)
  end
end
