class RemoveAvgProductivityScoreFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :avg_productivity_score
  end
end
