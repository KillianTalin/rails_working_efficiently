class AddColumnToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :starts_at, :datetime
    add_column :tasks, :ends_at, :datetime
  end
end
