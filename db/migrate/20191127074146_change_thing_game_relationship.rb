class ChangeThingGameRelationship < ActiveRecord::Migration[6.0]
  def change
  	add_column :games, :thing_id, :integer
  end
end
