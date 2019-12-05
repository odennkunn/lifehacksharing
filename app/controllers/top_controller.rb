class TopController < ApplicationController

  before_action :user_decision, only: [:index]

  def index 
  end
  

  private

  def user_decision
    if user_signed_in?
      redirect_to articles_path
    end
  end

end
