class AddReferredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :referred, :integer, :null => false, :default => 0
  end
end
