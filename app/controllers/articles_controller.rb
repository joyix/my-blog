class ArticlesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:success] = "blog created"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.increment! :view_count
  end

  def destroy
    @article.destroy
    flash[:success] = "blog deleted"
    redirect_to request.referrer || root_url
  end

  def like
    @article = Article.find(params[:id])
    @article.increment! :like_count
    redirect_to @article
  end

  private
  
  def article_params
    params.require(:article).permit(:title, :content)
  end

  def correct_user
    @article = current_user.articles.find_by(id: params[:id])
    redirect_to root_url if @article.nil?
  end

end
