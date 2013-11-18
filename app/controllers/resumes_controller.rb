class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      flash[:notice] = "New resume entry has been added."
      # redirect_to resumes_path
      respond_to do |format|
        format.html { redirect_to @resume }
        format.js
      end
    else
      render "new"
    end
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      flash[:notice] = "This resume entry has been updated."
      redirect_to @resume
    else
      render "edit"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    # redirect_to resumes_path
    respond_to do |format|
      format.html { redirect_to @resume }
      format.js
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:title, :company, :description, :start_date, :end_date, :project, :rating, :url)
  end
end
