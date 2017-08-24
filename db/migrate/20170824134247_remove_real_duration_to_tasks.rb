class RemoveRealDurationToTasks < ActiveRecord::Migration[5.0]
  def change
        remove_column :tasks, :real_duration
  end
end
