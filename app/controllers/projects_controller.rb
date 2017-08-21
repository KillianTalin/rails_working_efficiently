class ProjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
    # @project = Project.new
  end

  def create
    # @project = Project.new(project_params)
    # @project.user = current_user
    #   if @project.save
    #     redirect_to projects_path
    #   else
    #     render :new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :color, :avg_productivity_score, :total_worktime)
  end
end
