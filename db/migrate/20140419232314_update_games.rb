class UpdateGames < ActiveRecord::Migration
	def up
		# round 1
		Game.find_by_slot(0).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(1).update_attributes(:team1_score => 0, :team2_score => 100)
		Game.find_by_slot(2).update_attributes(:team1_score => 0, :team2_score => 100)
		Game.find_by_slot(3).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(4).update_attributes(:team1_score => 0, :team2_score => 100)
		Game.find_by_slot(5).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(6).update_attributes(:team1_score => 0, :team2_score => 100)
		Game.find_by_slot(7).update_attributes(:team1_score => 100, :team2_score => 0)

		Game.find_by_slot(8).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(9).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(10).update_attributes(:team1_score => 0, :team2_score => 100)
		Game.find_by_slot(11).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(12).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(13).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(14).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(15).update_attributes(:team1_score => 100, :team2_score => 0)

		Game.find_by_slot(16).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(17).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(18).update_attributes(:team1_score => 0, :team2_score => 100)
		Game.find_by_slot(19).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(20).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(21).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(22).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(23).update_attributes(:team1_score => 100, :team2_score => 0)

		Game.find_by_slot(24).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(25).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(26).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(27).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(28).update_attributes(:team1_score => 0, :team2_score => 100)
		Game.find_by_slot(29).update_attributes(:team1_score => 99, :team2_score => 100)
		Game.find_by_slot(30).update_attributes(:team1_score => 100, :team2_score => 0)
		Game.find_by_slot(31).update_attributes(:team1_score => 100, :team2_score => 0)

		# round 2
		Game.create(:slot => 32, :team1 => Team.find_by_slot(0), :team2 => Team.find_by_slot(3), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 33, :team1 => Team.find_by_slot(5), :team2 => Team.find_by_slot(6), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 34, :team1 => Team.find_by_slot(9), :team2 => Team.find_by_slot(10), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 35, :team1 => Team.find_by_slot(13), :team2 => Team.find_by_slot(14), :team1_score => 100, :team2_score => 0)
		
		Game.create(:slot => 36, :team1 => Team.find_by_slot(16), :team2 => Team.find_by_slot(18), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 37, :team1 => Team.find_by_slot(21), :team2 => Team.find_by_slot(22), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 38, :team1 => Team.find_by_slot(24), :team2 => Team.find_by_slot(26), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 39, :team1 => Team.find_by_slot(28), :team2 => Team.find_by_slot(30), :team1_score => 100, :team2_score => 0)
		
		Game.create(:slot => 40, :team1 => Team.find_by_slot(32), :team2 => Team.find_by_slot(34), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 41, :team1 => Team.find_by_slot(37), :team2 => Team.find_by_slot(38), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 42, :team1 => Team.find_by_slot(40), :team2 => Team.find_by_slot(42), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 43, :team1 => Team.find_by_slot(44), :team2 => Team.find_by_slot(46), :team1_score => 0, :team2_score => 100)
		
		Game.create(:slot => 44, :team1 => Team.find_by_slot(48), :team2 => Team.find_by_slot(50), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 45, :team1 => Team.find_by_slot(52), :team2 => Team.find_by_slot(54), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 46, :team1 => Team.find_by_slot(57), :team2 => Team.find_by_slot(59), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 47, :team1 => Team.find_by_slot(60), :team2 => Team.find_by_slot(62), :team1_score => 0, :team2_score => 100)
	
		# round 3
		Game.create(:slot => 48, :team1 => Team.find_by_slot(0), :team2 => Team.find_by_slot(6), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 49, :team1 => Team.find_by_slot(9), :team2 => Team.find_by_slot(13), :team1_score => 100, :team2_score => 0)

		Game.create(:slot => 50, :team1 => Team.find_by_slot(16), :team2 => Team.find_by_slot(22), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 51, :team1 => Team.find_by_slot(26), :team2 => Team.find_by_slot(28), :team1_score => 0, :team2_score => 100)
		
		Game.create(:slot => 52, :team1 => Team.find_by_slot(32), :team2 => Team.find_by_slot(38), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 53, :team1 => Team.find_by_slot(40), :team2 => Team.find_by_slot(46), :team1_score => 0, :team2_score => 100)
		
		Game.create(:slot => 54, :team1 => Team.find_by_slot(50), :team2 => Team.find_by_slot(54), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 55, :team1 => Team.find_by_slot(57), :team2 => Team.find_by_slot(62), :team1_score => 0, :team2_score => 100)
	
		# elite 8
		Game.create(:slot => 56, :team1 => Team.find_by_slot(0), :team2 => Team.find_by_slot(9), :team1_score => 100, :team2_score => 0)
		Game.create(:slot => 57, :team1 => Team.find_by_slot(22), :team2 => Team.find_by_slot(28), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 58, :team1 => Team.find_by_slot(32), :team2 => Team.find_by_slot(46), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 59, :team1 => Team.find_by_slot(50), :team2 => Team.find_by_slot(62), :team1_score => 100, :team2_score => 0)

		# final 4
		Game.create(:slot => 60, :team1 => Team.find_by_slot(0), :team2 => Team.find_by_slot(28), :team1_score => 0, :team2_score => 100)
		Game.create(:slot => 61, :team1 => Team.find_by_slot(46), :team2 => Team.find_by_slot(50), :team1_score => 0, :team2_score => 100)

		# championship
		Game.create(:slot => 62, :team1 => Team.find_by_slot(28), :team2 => Team.find_by_slot(50), :team1_score => 100, :team2_score => 0)
	end

	def down
	end
end
