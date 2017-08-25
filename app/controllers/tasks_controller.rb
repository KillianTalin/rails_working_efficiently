class TasksController < ApplicationController
  before_action :task_set, only: [:show, :edit, :update, :destroy, :select]
  before_action :project_set, only: [:index, :show, :create, :edit, :update, :destroy]

  def index
    @tasks = policy_scope(Task).where(project_id: @project)
    @tasks_finished = @tasks.where(done: true)
    @tasks_no_realised = @tasks.where(elapsed_time: 0)
    @tasks_futur = @tasks.where("elapsed_time > ?", 0)
    @time = @tasks.sum(:elapsed_time)
    @projects = Project.where(user_id: current_user.id)
    @date = @project.end_date
    @avancement = (@tasks.sum(:elapsed_time) / @tasks.sum(:forecast_duration)) * 100 unless @tasks.empty?
    # @score = (@tasks.average(:productivity_score).round(2) / 5) * 100
    # if params[:project_id].present? && params[:tag_id].present?
    #   @tag = Tag.find(params[:tag_id])
    #   @project = Project.find(params[:project_id])
    #   @tasks = @tasks.where(project: @project, tag_id: @tag)
    #   @tag_projet = Task.where(project: @project, user_id: current_user.id)
    #   @time = @tasks.where(project: @project).where(tag: @tag).sum(:real_duration)
    #   @score = (@tasks.where(project: @project).where(tag: @tag).average(:productivity_score) / 5) * 100
    #   @tags = @tag_projet.map { |task| {project: @project, id: task.tag.id, name: task.tag.name}  }.uniq

    # elsif params[:project_id].present?
    #   @project = Project.find(params[:project_id])
    #   @tasks = @tasks.where(project: @project)
    #   @time = @tasks.where(project: @project).sum(:real_duration)
    #   @tags = @tasks.map { |task| {project: @project, id: task.tag.id, name: task.tag.name}  }.uniq
    #   @score = (@tasks.where(project: @project).average(:productivity_score).round(2) / 5) * 100
    @task = Task.new
  end

  def show
  end

  def new
    @task = Task.new
    authorize(@task)
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.elapsed_time = 0
    @task.project = @project
    authorize(@task)
      if @task.save
        redirect_to project_tasks_path(@task.project_id), notice: 'Task was successfully created 👍'
      else
        render :new
      end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path(@task.project), notice: 'Task was successfully updated.'
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path, notice: '❌ Task was successfully destroyed.'
  end

  def index_direct
    @tasks = policy_scope(Task).where(user: current_user)
    @tasks_finished = @tasks.where(done: true)
    @tasks_no_realised = @tasks.where(elapsed_time: 0)
    @tasks_futur = @tasks.where("elapsed_time > ?", 0)
    @time = @tasks.sum(:elapsed_time)
    @projects = Project.where(user_id: current_user.id)
    # @score = (@tasks.average(:productivity_score).round(2) / 5) * 100
  end

  def select
    @task = Task.find(params[:id])
    @task.selected = true
    @task.save
    redirect_to dashboards_select_tasks_path
  end

  private

  def task_set
    @task = Task.find(params[:id])
    authorize(@task)
  end

  def project_set
    @project = Project.find(params[:project_id])
    authorize(@project)
  end

  def task_params
    params.require(:task).permit(:name, :project_id, :name, :starts_at, :ends_at, :elapsed_time, :forecast_duration, :category, :productivity_score, :tag_id,)
  end

end
