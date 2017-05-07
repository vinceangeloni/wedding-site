class Addcodetoinvites < ActiveRecord::Migration
  def change
  	add_column :invites, :rsvp_code, :string
  end
end
