class AddSelectedToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :selected, :boolean
  end
end
