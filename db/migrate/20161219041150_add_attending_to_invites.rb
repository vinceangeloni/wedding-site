class AddAttendingToInvites < ActiveRecord::Migration
  def change
  	add_column :invites, :attending, :boolean, :null => false
  end
end
