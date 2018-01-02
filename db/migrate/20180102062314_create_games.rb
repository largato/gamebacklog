class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.date :release_date
      t.integer :platform_id
      t.timestamps
    end
  end
end
