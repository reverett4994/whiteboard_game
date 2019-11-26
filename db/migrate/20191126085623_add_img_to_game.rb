class AddImgToGame < ActiveRecord::Migration[6.0]
  def change
  	add_column :games, :winning_url, :LONGTEXT	
  end
end
