class ChaptersController < ApplicationController
  before_action :require_login, except: [:show]

  def show
    @chapter = Chapter.find(params[:id])
  end

  def new
    @author = Author.find(params[:author_id])
    @work = Work.find(params[:work_id])
    @chapter = Chapter.new
  end

  def create
    @author = Author.find(params[:author_id])
    @work = Work.find(params[:work_id])
    @chapter = Chapter.new(chapter_params)

    if @chapter.save
      redirect_to author_work_chapter_path(@work.author, @work, @chapter)
    else
      render 'new'
    end
  end

  def edit
    @chapter = Chapter.find(params[:id])
  end

  def update
    @author = Author.find(params[:author_id])
    @work = Work.find(params[:work_id])
    @chapter = Chapter.find(params[:id])

    if @chapter.update(chapter_params)
      redirect_to author_work_chapter_path(@work.author, @work, @chapter)
    else
      render 'edit'
    end
  end

  private
  def chapter_params
    params.require(:chapter).permit(:name, :work_id, :start_line, :end_line)
  end
end
