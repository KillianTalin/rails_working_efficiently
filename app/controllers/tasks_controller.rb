class TasksController < ApplicationController
  before_action :task_set, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = policy_scope(Task).where(user_id: current_user.id)

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
        redirect_to tasks_path(@task), notice: 'Task was successfully created.'
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

  def destroy
    @task.destroy
    redirect_to root_path, notice: 'Task was successfully destroyed.'
  end

  private

  def task_set
    @task = Task.find(params[:id])
    authorize(@task)

  end

  def task_params
    params.require(:task).permit(:name, :project_id, :name, :starts_at, :ends_at, :forecast_duration, :category, :productivity_score, :tag_id)
  end
end
