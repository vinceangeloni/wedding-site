class Addcolumnstoguests < ActiveRecord::Migration
  def change
  	add_column :guests, :num_attending, :integer, :null => false, :default => 1
  end
end
