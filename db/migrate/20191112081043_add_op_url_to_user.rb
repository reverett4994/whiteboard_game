class AddOpUrlToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :op_url, :string
  end
end
