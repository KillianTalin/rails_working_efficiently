class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
   @projects = policy_scope(Project).where(user: current_user).order(end_date: :desc)

   # pour afficher la stat sur les taches effectuées
   #heure de taf = projet.tasks.sum(:estimation).to_time.strftime("%H").to_i
   #minutes de taf = projet.tasks.sum(:estimation).to_time.strftime("%M").to_i / 60

  #      unless @projects.tasks.empty?
  #     # || @tasks_in_progress.empty?
  #     #to do tache in progress

  #     #tache done true
  #     #(ladditionn de toute les heures des estimations des taches done: true les multiplié par 3600
  #     @hours_passed = @projects.tasks.sum(:estimation).to_time.strftime("%H").to_i * 3600
  #     #laddition des minutes des estimations des taches done: true les mutiplié par 60)
  #     @passed = @hours_passed + @minutes_passed
  #     #laddition d elasptimed_time des taches :done true
  #     if @passed > 0
  #       @prevision = @tasks.where(done: true).sum(:elapsed_time) - @passed
  #     elsif @passed < 0
  #       @prevision = @passed - @tasks.where(done: true).sum(:elapsed_time)
  #     end
  # end
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
    if @project.client_id.nil?
      @project.client = Client.create(name: params[:client][:name])
    end
    if @project.save
        redirect_to project_tasks_path(@project.id), notice: 'Project was successfully created 👍 Add a task now!'
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
