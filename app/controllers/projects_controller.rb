class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = policy_scope(Project)
  end

  def show
  end

  def new
    @project = Project.new
    authorize(@project)
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    authorize(@project)
      if @project.save
        redirect_to projects_path
      else
        render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize(@project)
  end

  def project_params
    params.require(:project).permit(:name, :user_id, :start_date, :end_date, :color, :avg_productivity_score, :total_worktime)
  end
end
