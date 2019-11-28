class ArticlesController < ApplicationController
  
  def index
    @articles = Article.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to articles_path
    else
      render action: :new
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :image, :text, :category).merge(user_id: current_user.id)
  end
end
