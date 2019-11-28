class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit]
  
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

  def show 
  end

  def destroy
  end

  def edit
  end


  private
  def article_params
    params.require(:article).permit(:title, :image, :text, :category).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
