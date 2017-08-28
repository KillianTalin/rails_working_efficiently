class AddEstimationToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :estimation, :time
  end
end
