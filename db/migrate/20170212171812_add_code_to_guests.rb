class AddCodeToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :rsvp_code, :string
  end
end
