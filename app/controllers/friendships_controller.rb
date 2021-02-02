class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user_id = current_user.id
    @requests_sent = Friendship.sent_requests(@current_user_id)
    @requests_received = Friendship.received_requests(@current_user_id)
    @friendship = Friendship.new
  end

# BAD - DO NOT NAME ACTIONS 'REQUEST'
  # def request
  # end

  def create
    @new_request = Friendship.new(friend_request_params)
    if @new_request.save
      flash[:notice] = 'Friend request sent!'
      redirect_to friendships_path
    else
      # flash.now[:failure] = 'Error - Please try again'
      flash.now[:alert] = @new_request.errors.full_messages # customize error messages
      @friend_request = Friendship.new
      @user = User.find(params[:friendship][:receiver_id])
      render 'users/show'
    end
  end

  def update
    @request = Friendship.find(params[:id])
    @friend = @request.sender
    if params[:commit] == 'Accept'
      @request.update(is_request: false)
      flash[:notice] = "You are now friends with #{@friend.name}!"
      redirect_to @friend
    elsif params[:commit] == 'Reject'
      @request.destroy
      @requests_received = Friendship.received_requests(current_user.id)
      @requests_sent = Friendship.sent_requests(current_user.id)
      flash[:notice] = "#{@friend.name}'s friend request has been rejected."
      # render 'index'
      redirect_to friendships_path
    end
  end

  private

  def friend_request_params
    params.require(:friendship).permit(:sender_id, :receiver_id)
  end
end
