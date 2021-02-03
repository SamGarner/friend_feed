class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(new_comment_params)
    if @comment.save
      flash[:notice] = 'Your comment has been added!'
    else
      flash[:alert] = 'Your comment was not added. Please try again.'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def new_comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end
