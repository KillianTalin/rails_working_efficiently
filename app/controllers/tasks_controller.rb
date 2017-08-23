class TasksController < ApplicationController
  before_action :task_set, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = policy_scope(Task).where(user_id: current_user.id)
    @time = @tasks.sum(:real_duration)
    @projects = Project.where(user_id: current_user.id)
    @tags = Project.last.tags.uniq
    @score = (@tasks.average(:productivity_score) / 5) * 100
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
      @tasks = @tasks.where(project: @project)
      @time = @tasks.where(project: @project).sum(:real_duration)
      @score = (@tasks.where(project: @project).average(:productivity_score) / 5) * 100
      if params[:tag_id].present?
        @tag = Tag.find(params[:tag_id])
        @tasks = @tasks.where(project: @project).where(params[tag: @tag])
        @time = @tasks.where(project: @project).where(params[tag: @tag]).sum(:real_duration)
        @score = (@tasks.where(project: @project).where(params[tag: @tag]).average(:productivity_score) / 5) * 100
      end
    end
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
    authorize(@task)
      if @task.save
        redirect_to tasks_path, notice: 'Task was successfully created 👍'
      else
        render :new
      end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'Task was successfully updated.'
    else
      render :new
    end
  end

  # def update_elapsed_time
  #   @task.elapsed_time = params[:elapsed_time]
  # end

  def destroy
    @task.destroy
    redirect_to root_path, notice: '❌ Task was successfully destroyed.'
  end

  private

  def task_set
    @task = Task.find(params[:id])
    authorize(@task)
  end

  def task_params
    params.require(:task).permit(:name, :project_id, :name, :starts_at, :ends_at, :elapsed_time, :forecast_duration, :category, :productivity_score, :tag_id, :real_duration)
  end
end
