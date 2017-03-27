class AuthorsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @authors = Author.filter(params.slice(:starts_with))
  end

  def show
    @author = Author.friendly.find(params[:id])
    @works = @author.works.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def edit
    @author = Author.friendly.find(params[:id])
  end

  def update
    @author = Author.friendly.find(params[:id])

    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.friendly.find(params[:id])
    @author.destroy

    redirect_to authors_path
  end

  private
  def author_params
    params.require(:author).permit(:name, :category, :bust)
  end
end
