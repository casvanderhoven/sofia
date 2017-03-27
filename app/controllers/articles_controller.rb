class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :find_parents, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @works = Work.joins(:articles).uniq.all
  end

  def show
  end

  def new
    @author = Author.find(params[:author_id])
    @work = Work.find(params[:work_id])
    @article = Article.new
  end

  def create
    @author = Author.find(params[:author_id])
    @work = Work.find(params[:work_id])
    @article = Article.new article_params

    if @article.save
      flash[:success] = "Article created!"
      redirect_to author_work_article_path(@author, @work, @article)
    else
      flash[:error] = "It didn't work!"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update article_params
      flash[:success] = "The article was successfully saved!"
      redirect_to author_work_article_path(@author, @work, @article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :work_id)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def find_parents
    @author = Author.find(params[:author_id])
    @work = Work.find(params[:work_id])
  end
end
