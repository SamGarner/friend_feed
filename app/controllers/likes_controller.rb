class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(likes_params)
    if @like.save
      #correct reach/violater of Demeter's Law to get User's name?
      flash[:notice] = "Liked #{@like.likable.user.name}'s #{@like.likable_type.downcase}."
    else
      flash[:alert] = "Your 'like' was not saved. Please try again."
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def likes_params
    params.require(:like).permit(:likable_id, :likable_type)
  end
end
