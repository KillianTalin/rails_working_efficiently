class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user
      redirect_to dashboards_path
    end
  end

  def list_tasks
    @select_tasks = current_user.tasks.where(selected: true)
    redirect_to dashboards_select_tasks_path if @select_tasks.blank?
  end

  def select_tasks
    @projects = current_user.projects
  # Formulaire avec checkbox
  end
end
