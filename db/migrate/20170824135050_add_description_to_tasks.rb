class AddDescriptionToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :description, :text
    add_column :tasks, :mit_task, :boolean
    add_column :tasks, :secondary_task, :boolean
  end
end
