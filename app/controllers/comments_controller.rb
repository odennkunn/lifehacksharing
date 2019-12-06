class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    @comment = Comment.create(text: comment_params[:text], article_id: comment_params[:article_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to article_path(params[:article_id]) }
      format.json
    end
  end

  private

  def comment_params
    params.permit(:text, :article_id)
  end

end
