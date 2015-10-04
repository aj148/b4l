module BracketMath
	class BracketMathHelper
		
		# Region order & format:
		# regions[0] –––      ––– regions[2]
		#              |––––––|
		# regions[1] –––      ––– regions[3]

		# THESE WILL CHANGE FROM YEAR TO YEAR!!
		@@regions = ['south', 'east', 'west', 'midwest']
		@@final_four = ['south_east', 'west_midwest']

		def self.get_region_order
			return @@regions
		end

		def self.get_final_four_order
			return @@final_four
		end

		# returns the region based on game slot number
		# useful for filtering and drawing the bracket
		# our brackets are formatted like this one: 
		# http://www.whitehouse.gov/sites/default/files/uploads/president-obama-2013-ncaa-tournament-bracket.jpeg
		def self.get_region(slot)
			case slot
			when 0..7, 32..35, 48..49, 56
				return @@regions[0]
			when 8..15, 36..39, 50..51, 57
				return @@regions[1]
			when 16..23, 40..43, 52..53, 58
				return @@regions[2]
			when 24..31, 44..47, 54..55, 59
				return @@regions[3]
			when 60
				return @@final_four[0]
			when 61
				return @@final_four[1]
			else
				return :championship
			end
		end

		# returns the round based on game slot number
		# useful for filtering and drawing the bracket
		def self.get_round(slot)
			case slot
			when 0..31
				return 0
			when 32..47
				return 1
			when 48..55
				return 2
			when 56..59
				return 3
			when 60..61
				return 4
			when 62
				return 5
			end
		end

		# returns the next game slot which the winner of the given game slot
		# should move on to. Here be dragons. But it works.
		def self.get_winner_slot(slot)
			round = get_round(slot)
			return slot + 2**(5-round) - (slot % 2**(6-round) + 1)/2	
		end

		# returns the slot range for a number of regions
		# calculated using some mathemagical gymnastics
		def self.get_slots(region, round)
			if region > 3
				raise "region must be between 0 and 3"
			end
			offset = ((6-round)..5).sum {|x| 2**x} 
			start = region * 2**(5-round)/4 + offset
			stop = start + 2**(5-round)/4 - 1
			return (start..stop).to_a
		end
	end
end