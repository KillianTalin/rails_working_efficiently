class AddPricePerDayToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :price_per_day, :integer
  end
end
