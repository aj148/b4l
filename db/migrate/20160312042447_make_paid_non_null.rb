class MakePaidNonNull < ActiveRecord::Migration
	def change
		change_column_null(:users, :paid, false, 0)
  	    change_column(:users, :paid, :integer, :default => 0)
  	end
  end
