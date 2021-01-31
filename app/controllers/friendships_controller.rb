class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user_id = current_user.id
    @requests_sent = Friendship.sent_requests(@current_user_id)
    @requests_received = Friendship.received_requests(@current_user_id)
    @friendship = Friendship.new
  end

  def create
    @new_request = Friendship.new(friend_request_params)
    if @new_request.save
      flash[:success] = 'Friend request sent!'
      redirect_to friendships_path
    else
      # flash.now[:failure] = 'Error - Please try again'
      flash.now[:failure] = @new_request.errors.full_messages # customize error messages
      @friend_request = Friendship.new
      @user = User.find(params[:friendship][:receiver_id])
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
