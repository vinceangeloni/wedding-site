class UpdateGuests < ActiveRecord::Migration
  def change
  	rename_column :guests, :first_name, :name
  	remove_column :guests, :last_name
  end
end
