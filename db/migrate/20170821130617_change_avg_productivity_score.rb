class ChangeAvgProductivityScore < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :avg_productivity_score, :float
  end
end
