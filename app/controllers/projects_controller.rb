class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
   @project = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new

  end

  def create
    @project = Project.new(project_params)
    @project.save
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @peoject = Project.find(params[:id])
    @project.update(params[:project])
  end

  def destroy

  end

#   private

#   def set_project
#     @project = Project.find(params[:id])
#     authorize @project
#   end

  def project_params
    params.require(:project).permit(:name, :user_id, :start_date, :end_date, :color, :total_worktime)
  end
# end
