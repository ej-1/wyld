class AddCheckboxTickedToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :checkbox_ticked, :boolean
  end
end
