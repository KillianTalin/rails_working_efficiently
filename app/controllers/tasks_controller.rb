class TasksController < ApplicationController
  before_action :task_set, only: [:show, :edit, :update, :destroy, :select]
  before_action :project_set, only: [:index, :show, :create, :edit, :update, :destroy]

  def index
    @tasks = policy_scope(Task).where(project_id: @project)
    @tasks_finished = @tasks.where(done: true)
    @tasks_to_do = @tasks.where(done: false).where(elapsed_time: 0)
    @tasks_in_progress = @tasks.where("elapsed_time > ?", 0).where(done: false)
    @projects = Project.where(user_id: current_user.id)
    @task = Task.new

    if @tasks.sum(:estimation) == "0"

     @time_passed_integer = 0

     @total_hours_passed = 0
       #laddition des minutes des estimations des taches done: true les mutiplié par 60)
     @total_minutes_passed = 0
     @time_total_integer = 0

     else

    @time_passed_integer = @tasks.sum(:elapsed_time)

    @total_hours_passed = @tasks.sum(:estimation).to_time.strftime("%H").to_i * 3600
      #laddition des minutes des estimations des taches done: true les mutiplié par 60)
    @total_minutes_passed = @tasks.sum(:estimation).to_time.strftime("%M").to_f * 60
    @time_total_integer = @total_hours_passed.to_f + @total_minutes_passed.to_f
    end


    #--------temps total-------
    @passed = 0
    @time_reel_task_done = 0
    unless @tasks_finished.empty?
      #tache done true
      #(ladditionn de toute les heures des estimations des taches done: true les multiplié par 3600
      @hours_passed = @tasks.where(done: true).sum(:estimation).to_time.strftime("%H").to_i * 3600
      #laddition des minutes des estimations des taches done: true les mutiplié par 60)
      @minutes_passed = @tasks.where(done: true).sum(:estimation).to_time.strftime("%M").to_i * 60
      @passed = @hours_passed + @minutes_passed
      #laddition d elasptimed_time des taches :done true
      @prevision = @passed - @tasks.sum(:elapsed_time)

      @hours_passed_false = @tasks.sum(:estimation).to_time.strftime("%H").to_i * 3600
      #laddition des minutes des estimations des taches done: true les mutiplié par 60)
      @minutes_passed_false = @tasks.sum(:estimation).to_time.strftime("%M").to_i * 60

      @passed_false = @hours_passed_false + @minutes_passed_false

      @pourcent_estimation_time = ((@passed.to_f / @passed_false.to_f) * 100).to_i
      @time_reel_task_done = @tasks.where(done: true).sum(:elapsed_time)
      @pourcent_reel_time_true = ((@time_reel_task_done.to_f / @passed_false.to_f) * 100).to_i

      @tasks_done = @tasks_finished.count

    end

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
      @tasks = policy_scope(Task).where(project_id: @project)
      tasks_finished = @tasks.where(done: true)
      @tasks_done = tasks_finished.count
      @total_task = @tasks.count
      respond_to do |format|
        format.html { redirect_to project_tasks_path(@task.project_id) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.js  # <-- idem
      end
    end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      @task.update(done: true) if params[:task][:done]
      respond_to do |format|
        format.html { redirect_to project_tasks_path(@task.project) }
        format.js  # <-- will render `app/views/tasks/update.js.erb`
      end
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path
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
    if params[:task][:submit] == "0"
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
    params.require(:task).permit(:name, :project_id, :name, :starts_at, :ends_at, :elapsed_time, :category, :productivity_score, :estimation,)
  end

end
