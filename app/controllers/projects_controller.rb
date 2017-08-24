class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
   @projects = policy_scope(Project).where(user: current_user)
  end

  def show

  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.save
  end

  def edit

  end

  def update

    @project.update(project_params)
  end

  def destroy

    @project.destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:name, :user_id, :start_date, :end_date, :color, :total_worktime)
  end
end
