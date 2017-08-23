class AddElapsedTimeToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :elapsed_time, :integer
  end
end
