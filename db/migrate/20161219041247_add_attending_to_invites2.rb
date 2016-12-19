class AddAttendingToInvites2 < ActiveRecord::Migration
  def change
  	add_column :invites, :attending, :boolean, :null => false, :default => false
  end
end
