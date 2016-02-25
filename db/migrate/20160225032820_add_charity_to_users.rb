class AddCharityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :charity, :string
  end
end
