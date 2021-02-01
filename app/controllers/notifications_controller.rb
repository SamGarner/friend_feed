class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @requests_received = Friendship.received_requests(current_user.id)
    @likes = 1 #placeholder
    @comments = 1 #placeholder
  end
end
