class TasksController < ApplicationController
  before_action :task_set, only: [:show, :edit, :update, :destroy, :select]
  before_action :project_set, only: [:index, :show, :create, :edit, :update, :destroy]

  def index
    @tasks = policy_scope(Task).where(project_id: @project)
    @tasks_finished = @tasks.where(done: true)
    @tasks_to_do = @tasks.where(done: false).where(elapsed_time: 0)
    @tasks_in_progress = @tasks.where("elapsed_time > ?", 0).where(done: false)
    @time_passed = Time.at(@tasks.sum(:elapsed_time)).utc.strftime("%Hh %Mmin %Ss")
    @projects = Project.where(user_id: current_user.id)
    @date = @project.end_date
    @task = Task.new

    if @tasks.where(done: false).empty?
      @time_to_do = '00:00:00'.to_time.strftime("%Hh %Mmin")
    else
      @time_to_do = @tasks.where(done: false).sum(:estimation).to_time.strftime("%Hh %Mmin")
    end

    unless @tasks_finished.empty?
      # || @tasks_in_progress.empty?
      #to do tache in progress

      #tache done true
      #(ladditionn de toute les heures des estimations des taches done: true les multiplié par 3600
      @hours_passed = @tasks.where(done: true).sum(:estimation).to_time.strftime("%H").to_i * 3600
      #laddition des minutes des estimations des taches done: true les mutiplié par 60)
      @minutes_passed = @tasks.where(done: true).sum(:estimation).to_time.strftime("%M").to_i * 60
      @passed = @hours_passed + @minutes_passed
      #laddition d elasptimed_time des taches :done true
      if @passed > 0
        @prevision = @tasks.where(done: true).sum(:elapsed_time) - @passed
      elsif @passed < 0
        @prevision = @passed - @tasks.where(done: true).sum(:elapsed_time)
      end
    end
    @tasks_done = @tasks_finished.count
    @total_task = @tasks.count
    @pourcent_done = (@tasks_done.to_f / @total_task.to_f) * 100
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
      @task.update(done: true) if params[:task][:done]
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
    @tasks_to_do = @tasks.where(done: false).where(elapsed_time: 0)
    @tasks_in_progress = @tasks.where("elapsed_time > ?", 0).where(done: false)
    @time = @tasks.sum(:elapsed_time)
    @projects = Project.where(user_id: current_user.id)
    # @score = (@tasks.average(:productivity_score).round(2) / 5) * 100
  end

  def select
    @task = Task.find(params[:id])
    if params[:task][:submit] == "1"
      @task.selected = false
    else
      @task.selected = true
    end
    @task.save!
    respond_to do |format|
      format.html { redirect_to dashboards_select_tasks_path }
      format.js
    end
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
    params.require(:task).permit(:name, :project_id, :name, :starts_at, :ends_at, :elapsed_time, :forecast_duration, :category, :productivity_score, :estimation,)
  end

end
