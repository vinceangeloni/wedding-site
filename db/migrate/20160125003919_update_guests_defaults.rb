class UpdateGuestsDefaults < ActiveRecord::Migration
  def change
  	remove_column :guests, :num_attending
  	remove_column :guests, :menu_item
  	remove_column :guests, :dietary
  	remove_column :guests, :dietary_text
  end
end
