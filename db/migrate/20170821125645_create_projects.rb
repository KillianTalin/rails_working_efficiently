class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :color
      t.integer :avg_productivity_score
      t.float :total_worktime

      t.timestamps
    end
  end
end
