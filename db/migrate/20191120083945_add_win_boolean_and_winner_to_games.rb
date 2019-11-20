class AddWinBooleanAndWinnerToGames < ActiveRecord::Migration[6.0]
  def change
  	add_column :games, :completed, :boolean, default: false
   	add_column :games, :winner, :string
  end
end
