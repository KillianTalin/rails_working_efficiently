class DashboardsController < ApplicationController

  def list_tasks
    @selected_tasks = current_user.tasks.where(selected: true)
    authorize(@selected_tasks)
    redirect_to select_tasks_path if @select_tasks.blank?
  end

  def select_tasks
    @projects = current_user.projects
    authorize(@projects)
  # Formulaire avec checkbox
  end

end
