class CreateThings < ActiveRecord::Migration[6.0]
  def change
    create_table :things do |t|
      t.string :name
	  t.belongs_to :game
      t.timestamps
    end
  end
end
