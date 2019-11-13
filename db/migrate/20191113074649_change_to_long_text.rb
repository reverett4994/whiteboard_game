class ChangeToLongText < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :op_url, :LONGTEXT
  end
end
