class AddThegamesdbidToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :thegamesdb_id, :integer
  end
end
