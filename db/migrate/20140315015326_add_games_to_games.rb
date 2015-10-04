class AddGamesToGames < ActiveRecord::Migration
	def up
		Team.all.each_slice(2).with_index do |(team1, team2), i| 
			Game.create :team1 => team1, :team2 => team2, :slot => i
		end
	end

	def down
		Game.destroy_all
	end
end
