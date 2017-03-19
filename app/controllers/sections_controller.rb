class SectionsController < ApplicationController
  before_action :require_login

  def new
    @section = Section.new
    @chapter = Chapter.find(params[:chapter_id])
  end

  def create
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.new(section_params)

    if @section.save
      redirect_to author_work_chapter_path(@chapter.work.author, @chapter.work, @chapter)
    else
      render 'new'
    end
  end

  def edit
    @section = Section.find(params[:id])
    @chapter = Chapter.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    @chapter = Chapter.find(params[:id])

    if @section.update(section_params)
      redirect_to author_work_chapter_path(@chapter.work.author, @chapter.work, @chapter)
    else
      render 'edit'
    end
  end

  def destroy
    @chapter = Chapter.find(params[:chapter_id])
    @section = Section.find(params[:id])
    @section.destroy

    redirect_to @chapter
  end

  private
  def section_params
    params.require(:section).permit(:name, :original, :translation, :start_line, :end_line, :chapter_id)
  end
end
