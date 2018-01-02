class RemoveLaunchYearFromPlatforms < ActiveRecord::Migration[5.1]
  def change
    remove_column :platforms, :launch_year
  end
end
