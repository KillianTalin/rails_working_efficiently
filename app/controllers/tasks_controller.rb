class TasksController < ApplicationController
  before_action :task_set, only: [:show, :edit, :update, :destroy]

  def index

  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_set)
      if @task.save
        redirect_to root
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

  def task_params
    @task = Task.find(params[:id])
  end

  def task_set
    params.require(:task).permit(:name, :project_id, :name, :starts_at, :ends_at, :forecast_duration, :category, :productivity_score)
  end


end
