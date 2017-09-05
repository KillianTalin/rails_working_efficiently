class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = policy_scope(Project).where(user: current_user)
    @projects_passed = @projects.where("end_date < ?", Date.today).order(end_date: :asc)
    @projects_futur = @projects.where("end_date > ?", Date.today).order(end_date: :asc)
    @projects_today = @projects.where("end_date = ?", Date.today).order(end_date: :asc)
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

    if @project.client_id.nil? && params[:client][:name].empty? == false
      @project.client = Client.new(name: params[:client][:name])
      @project.client.user_id = current_user.id
      @project.client.save

    end
    if @project.save
        redirect_to project_tasks_path(@project.id)
      else
        render :new
      end
  end

  def edit

  end

  def update
    @project.update(project_params)
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  def project_params
    params.require(:project).permit(:name, :user_id, :start_date, :end_date, :color, :total_worktime, :client_id, :description, :price_per_day)
  end
end
