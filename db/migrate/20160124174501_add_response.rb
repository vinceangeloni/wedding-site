class AddResponse < ActiveRecord::Migration
  def change
  	add_column :guests, :response, :boolean, :default => false
  end
end
