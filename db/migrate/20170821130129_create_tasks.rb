class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.references :project, foreign_key: true
      t.string :name
      t.integer :forecast_duration
      t.integer :real_duration
      t.string :category
      t.integer :productivity_score
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
