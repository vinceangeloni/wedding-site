class Adddietarytoguests < ActiveRecord::Migration
  def change
  	add_column :guests, :dietary_text, :string
  end
end
