class DropTags < ActiveRecord::Migration[5.0]


  def change
    remove_column :tasks, :tag_id
    drop_table :tags
  end
end
