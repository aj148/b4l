class AddInvitesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invites, :integer, :null => false, :default => 0
  end
end
