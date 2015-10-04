class CreateTeams < ActiveRecord::Migration
	def change
		create_table :teams do |t|
			t.string :name
			t.string :image_url
			t.integer :slot
			t.integer :seed
		end
	end
end
