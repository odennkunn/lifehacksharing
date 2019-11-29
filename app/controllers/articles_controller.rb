class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :destroy, :update]
  
  def index
    @articles = Article.includes(:user).page(params[:page]).per(6).order("created_at DESC")
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
    if @article.user_id == current_user.id
      @article.destroy
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      redirect_to edit_article_path
    end
  end

  def dele
  end

  private
  def article_params
    params.require(:article).permit(:title, :image, :text, :category).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
