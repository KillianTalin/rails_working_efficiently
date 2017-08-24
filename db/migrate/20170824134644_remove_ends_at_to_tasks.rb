class RemoveEndsAtToTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :ends_at
    remove_column :tasks, :starts_at


  end
end
