class RenameGueststoInvites < ActiveRecord::Migration
  def change
  	rename_table :guests, :invites
  end
end
