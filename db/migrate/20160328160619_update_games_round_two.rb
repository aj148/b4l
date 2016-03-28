class UpdateGamesRoundTwo < ActiveRecord::Migration
	def up
		# # round 1
		# Game.find_by_slot(0).update_attributes(:team1_score => 100, :team2_score => 0) #KU W austin
		# Game.find_by_slot(1).update_attributes(:team1_score => 0, :team2_score => 100) #col L uconn
		# Game.find_by_slot(2).update_attributes(:team1_score => 100, :team2_score => 0) #MD W SDS
		# Game.find_by_slot(3).update_attributes(:team1_score => 0, :team2_score => 100) #Cal L Hawaii
		# Game.find_by_slot(4).update_attributes(:team1_score => 0, :team2_score => 100) #Ari L Wichita St.
		# Game.find_by_slot(5).update_attributes(:team1_score => 100, :team2_score => 0) #Miami W Buff
		# Game.find_by_slot(6).update_attributes(:team1_score => 100, :team2_score => 0) #Iowa W Temple
		# Game.find_by_slot(7).update_attributes(:team1_score => 100, :team2_score => 0) #Vill W UNC A

		# Game.find_by_slot(8).update_attributes(:team1_score => 100, :team2_score => 0) #Oregon W HC
		# Game.find_by_slot(9).update_attributes(:team1_score => 100, :team2_score => 0) #St. Joe W Cinc. 
		# Game.find_by_slot(10).update_attributes(:team1_score => 0, :team2_score => 100) #Baylor L Yale
		# Game.find_by_slot(11).update_attributes(:team1_score => 100, :team2_score => 0) #Duke W. UNCW
		# Game.find_by_slot(12).update_attributes(:team1_score => 0, :team2_score => 100) #Tex L UNI
		# Game.find_by_slot(13).update_attributes(:team1_score => 100, :team2_score => 0) #TAM W GB
		# Game.find_by_slot(14).update_attributes(:team1_score => 0, :team2_score => 100) #OSU L VCU
		# Game.find_by_slot(15).update_attributes(:team1_score => 100, :team2_score => 0) #OU W CSUB

		# Game.find_by_slot(16).update_attributes(:team1_score => 100, :team2_score => 0) #UNC W FGCU
		# Game.find_by_slot(17).update_attributes(:team1_score => 0, :team2_score => 100) #USC L Prov
		# Game.find_by_slot(18).update_attributes(:team1_score => 100, :team2_score => 0) #Ind W Chat
		# Game.find_by_slot(19).update_attributes(:team1_score => 100, :team2_score => 0) #UK W StonyBrook
		# Game.find_by_slot(20).update_attributes(:team1_score => 100, :team2_score => 0) #ND W Mich
		# Game.find_by_slot(21).update_attributes(:team1_score => 0, :team2_score => 100) #WV L SFA
		# Game.find_by_slot(22).update_attributes(:team1_score => 100, :team2_score => 0) #Wisc W Pitt
		# Game.find_by_slot(23).update_attributes(:team1_score => 100, :team2_score => 0) #Xav W Web. St.

		# Game.find_by_slot(24).update_attributes(:team1_score => 100, :team2_score => 0) #UVA W Hamp
		# Game.find_by_slot(25).update_attributes(:team1_score => 0, :team2_score => 100) #TT L But
		# Game.find_by_slot(26).update_attributes(:team1_score => 0, :team2_score => 100) #Purd. L AR-LR
		# Game.find_by_slot(27).update_attributes(:team1_score => 100, :team2_score => 0) #ISU W Iona
		# Game.find_by_slot(28).update_attributes(:team1_score => 0, :team2_score => 100) #Set L Gonz
		# Game.find_by_slot(29).update_attributes(:team1_score => 100, :team2_score => 0) #Utah W Fres. St.
		# Game.find_by_slot(30).update_attributes(:team1_score => 0, :team2_score => 100) #Day L Syr.
		# Game.find_by_slot(31).update_attributes(:team1_score => 0, :team2_score => 100) #MSU L Mid. Tenn.

		# # round 2
		# Game.create(:slot => 32, :team1 => Team.find_by_slot(0), :team2 => Team.find_by_slot(3), :team1_score => 100, :team2_score => 0) #KU W UCONN
		# Game.create(:slot => 33, :team1 => Team.find_by_slot(4), :team2 => Team.find_by_slot(7), :team1_score => 100, :team2_score => 0) #UMD W Hawaii
		# Game.create(:slot => 34, :team1 => Team.find_by_slot(9), :team2 => Team.find_by_slot(10), :team1_score => 0, :team2_score => 100) #Wich. St L Miami
		# Game.create(:slot => 35, :team1 => Team.find_by_slot(12), :team2 => Team.find_by_slot(14), :team1_score => 0, :team2_score => 100) #Iowa L Villanova
		
		# Game.create(:slot => 36, :team1 => Team.find_by_slot(16), :team2 => Team.find_by_slot(18), :team1_score => 100, :team2_score => 0) #Ore W SJ
		# Game.create(:slot => 37, :team1 => Team.find_by_slot(21), :team2 => Team.find_by_slot(22), :team1_score => 0, :team2_score => 100) #Yale L Duke
		# Game.create(:slot => 38, :team1 => Team.find_by_slot(25), :team2 => Team.find_by_slot(26), :team1_score => 0, :team2_score => 100) #UNI L TAM
		# Game.create(:slot => 39, :team1 => Team.find_by_slot(29), :team2 => Team.find_by_slot(30), :team1_score => 0, :team2_score => 100) #VCU L OU
		
		# Game.create(:slot => 40, :team1 => Team.find_by_slot(32), :team2 => Team.find_by_slot(35), :team1_score => 100, :team2_score => 0) #UNC W Prov
		# Game.create(:slot => 41, :team1 => Team.find_by_slot(36), :team2 => Team.find_by_slot(38), :team1_score => 100, :team2_score => 0) #IU W UK
		# Game.create(:slot => 42, :team1 => Team.find_by_slot(40), :team2 => Team.find_by_slot(43), :team1_score => 100, :team2_score => 0) #ND W SFA
		# Game.create(:slot => 43, :team1 => Team.find_by_slot(44), :team2 => Team.find_by_slot(46), :team1_score => 100, :team2_score => 0) #Wisc W Xav
		
		# Game.create(:slot => 44, :team1 => Team.find_by_slot(48), :team2 => Team.find_by_slot(51), :team1_score => 100, :team2_score => 0) #UVA W But
		# Game.create(:slot => 45, :team1 => Team.find_by_slot(53), :team2 => Team.find_by_slot(54), :team1_score => 0, :team2_score => 100) #AR-LR L ISU
		# Game.create(:slot => 46, :team1 => Team.find_by_slot(57), :team2 => Team.find_by_slot(58), :team1_score => 100, :team2_score => 0) #Gonz W Utah
		# Game.create(:slot => 47, :team1 => Team.find_by_slot(61), :team2 => Team.find_by_slot(63), :team1_score => 100, :team2_score => 0) #Syr W Mid. Tenn
	
		# sweet 16
		Game.create(:slot => 48, :team1 => Team.find_by_slot(0), :team2 => Team.find_by_slot(4), :team1_score => 100, :team2_score => 0) #KU W Maryland
		Game.create(:slot => 49, :team1 => Team.find_by_slot(10), :team2 => Team.find_by_slot(14), :team1_score => 0, :team2_score => 100) #Miami L Vill

		Game.create(:slot => 50, :team1 => Team.find_by_slot(16), :team2 => Team.find_by_slot(22), :team1_score => 100, :team2_score => 0) #Ore W Duke
		Game.create(:slot => 51, :team1 => Team.find_by_slot(26), :team2 => Team.find_by_slot(30), :team1_score => 0, :team2_score => 100) #TAM L OU
		
		Game.create(:slot => 52, :team1 => Team.find_by_slot(32), :team2 => Team.find_by_slot(36), :team1_score => 100, :team2_score => 0) #UNC W IU
		Game.create(:slot => 53, :team1 => Team.find_by_slot(40), :team2 => Team.find_by_slot(44), :team1_score => 100, :team2_score => 0) #ND W Wisc
		
		Game.create(:slot => 54, :team1 => Team.find_by_slot(48), :team2 => Team.find_by_slot(54), :team1_score => 100, :team2_score => 0) #UVA W ISU
		Game.create(:slot => 55, :team1 => Team.find_by_slot(57), :team2 => Team.find_by_slot(61), :team1_score => 0, :team2_score => 100) #Gonz L Syr
	
		# elite 8
		Game.create(:slot => 56, :team1 => Team.find_by_slot(0), :team2 => Team.find_by_slot(14), :team1_score => 0, :team2_score => 100) #KU L Vill.
		Game.create(:slot => 57, :team1 => Team.find_by_slot(16), :team2 => Team.find_by_slot(30), :team1_score => 0, :team2_score => 100) #Ore L OU
		Game.create(:slot => 58, :team1 => Team.find_by_slot(32), :team2 => Team.find_by_slot(40), :team1_score => 100, :team2_score => 0) #UNC W ND 
		Game.create(:slot => 59, :team1 => Team.find_by_slot(48), :team2 => Team.find_by_slot(61), :team1_score => 0, :team2_score => 100) #UVA L Syr

		# #final 4
		# Game.create(:slot => 60, :team1 => Team.find_by_slot(14), :team2 => Team.find_by_slot(30), :team1_score => 0, :team2_score => 100) #Vill. L OU
		# Game.create(:slot => 61, :team1 => Team.find_by_slot(32), :team2 => Team.find_by_slot(61), :team1_score => 0, :team2_score => 100) #UNC L Syr
		
		# #Title game
		# Game.create(:slot => 62, :team1 => Team.find_by_slot(16), :team2 => Team.find_by_slot(30), :team1_score => 0, :team2_score => 100) #Ore L OU
		
		# # final 4
		# Game.create(:slot => 60, :team1 => Team.find_by_slot(0), :team2 => Team.find_by_slot(28), :team1_score => 0, :team2_score => 100)
		# Game.create(:slot => 61, :team1 => Team.find_by_slot(46), :team2 => Team.find_by_slot(50), :team1_score => 0, :team2_score => 100)

		# # championship
		# Game.create(:slot => 62, :team1 => Team.find_by_slot(28), :team2 => Team.find_by_slot(50), :team1_score => 100, :team2_score => 0)
	end

	def down
	end
end
