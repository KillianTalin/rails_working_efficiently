class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def list_tasks
    @selected_tasks = current_user.tasks.where(selected: true)
    redirect_to select_tasks_path if @select_tasks.blank?
  end

  def select_tasks
    @projects = current_user.projects
  # Formulaire avec checkbox
  end
end
