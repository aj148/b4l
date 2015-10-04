class Bracket < ActiveRecord::Base
	# dependencies
	require "bracket_math" # lib/bracket_math.rb

	# properties
	attr_accessible :name, :user, :score, :active

	# validations
	validates :name, :user, :presence => true

	# associations
	belongs_to :user
	has_many :predictions, :dependent => :destroy

	# helper methods for reaching through to the prediction scopes
	def region r
		self.predictions.region r
	end

	def slot m
		self.predictions.slot m
	end

	def round r
		self.predictions.round r
	end

	# Calculates the score of the bracket using the official standings
	#
	# Points are awarded as:
	# - The four play-in games prior to the first round will not be included
	# - All incorrect predictions will result in 0 points
	# - 1 for predicting a winner from round 1
	# - 2 for predicting a winner from round 2
	# - 4 for predicting a winner from the sweet sixteen
	# - 8 for predicting a winner from the elite eight
	# - 16 for predicting a winner from the final four
	# - 32 for predicting the winner of the championship game
	def update_score!
		score = 0
		predictions.each do |p|
			if p.correct?
				score += (2 ** p.round)
			end
		end
		self.update_attributes :score => score
	end

	def regions
		return BracketMath::BracketMathHelper.get_region_order
	end

	def slots(region, round)
		return BracketMath::BracketMathHelper.get_slots region, round
	end

	def winner_slot(slot)
		return BracketMath::BracketMathHelper.get_winner_slot slot
	end

	def final_four
		return BracketMath::BracketMathHelper.get_final_four_order
	end
end
