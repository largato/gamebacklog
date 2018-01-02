class CreatePlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :platforms do |t|
      t.string :name
      t.integer :launch_year

      t.timestamps
    end
  end
end
