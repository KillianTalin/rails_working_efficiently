class RemoveDoneToTasks < ActiveRecord::Migration[5.0]
  def change
        remove_column :tasks, :done
  end
end
