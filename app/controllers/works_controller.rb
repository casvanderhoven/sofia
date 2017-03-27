class WorksController < ApplicationController
  before_action :require_login, except: [:show]

  def show
    @work = Work.friendly.find(params[:id])
  end

  def new
    @author = Author.friendly.find(params[:author_id])
    @work = Work.new
  end

  def create
    @author = Author.friendly.find(params[:author_id] )
    @work = Work.new(work_params)

    if @work.save
      redirect_to author_work_path(@author, @work)
    else
      render 'new'
    end
  end

  def edit
    @author = Author.friendly.find(params[:author_id])
    @work = Work.friendly.find(params[:id])
  end

  def update
    @author = Author.friendly.find(params[:author_id])
    @work = Work.friendly.find(params[:id])

    if @work.update(work_params)
      redirect_to author_work_path(@author, @work)
    else
      render 'edit'
    end
  end

  def destroy
    @author = Author.friendly.find(params[:author_id])
    @work = Work.friendly.find(params[:id])
    @work.destroy

    redirect_to @author
  end

  private
  def work_params
    params.require(:work).permit(:name, :author_id)
  end
end
