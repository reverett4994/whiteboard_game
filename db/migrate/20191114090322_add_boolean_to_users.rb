class AddBooleanToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :guesser, :boolean, default: true
  end
end
