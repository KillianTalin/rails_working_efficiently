class RemoveProductivityScoreToTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :productivity_score
  end
end
