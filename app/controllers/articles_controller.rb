class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
      flash[:notice] = "article added"
    else
      flash[:error] = "what are you doing? you need a title."
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
      flash[:notice] = "article updated"
    else
      flash[:error] = "what are you doing? you need a title."
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end