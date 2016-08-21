class Addcolumnstoguests < ActiveRecord::Migration
  def change
  	add_column :guests, :num_attending, :integer, :null => false, :default => 1
  	add_column :guests, :menu_item, :integer, :null => false, :default => 1
  	add_column :guests, :dietary, :boolean, :default => false
  end
end
