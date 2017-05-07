class AddAuthenticatePasswordResetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_reset_token, :string, default: nil
    add_column :users, :password_reset_sent_at, :datetime, default: nil
    add_index :users, :password_reset_token
  end
end

