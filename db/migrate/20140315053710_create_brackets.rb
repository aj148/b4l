class CreateBrackets < ActiveRecord::Migration
	def change
		create_table :brackets do |t|
			t.integer :score
			t.string :name
			t.integer :user_id
			t.timestamps
		end

		add_index  :brackets, :user_id
	end
end
