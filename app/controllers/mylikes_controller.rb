class MylikesController < ApplicationController

  def show
    @likes = Like.select(:user_id, :article_id).distinct.where(user_id: current_user.id).page(params[:page]).per(6).order("created_at DESC")
  end

end
