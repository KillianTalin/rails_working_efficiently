class TasksController < ApplicationController
  before_action :task_set, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user
      if @task.save
        redirect_to tasks_path(@task)
      else
        render :new
      end
  end

  def edit

  end

  def update
    @task.update(task_params)
    redirect_to root_path
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def task_set
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :project_id, :name, :starts_at, :ends_at, :forecast_duration, :category, :productivity_score, :tag_id)
  end


end
