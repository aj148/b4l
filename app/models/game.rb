class Game < ActiveRecord::Base
	# dependencies
	require "bracket_math" # lib/bracket_math.rb


	# properties
	attr_accessible :team1, :team2, :team1_score, :team2_score, :slot, :round, :region

	# validations
	validates :team1, :team2, :slot, :round, :region, :presence => true
	validates :slot,  :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 62 }, :uniqueness => true

	# associations
	belongs_to :team1, :foreign_key => "team1_id", :class_name => "Team"
	belongs_to :team2, :foreign_key => "team2_id", :class_name => "Team"

  	# callbacks
  	before_validation :set_region
  	before_validation :set_round

	# scopes
	scope :slot, lambda { |s| where(:slot => s) }
	scope :round, lambda { |r| where(:round => r) }
	scope :region, lambda { |r| where(:region => r) }
	default_scope order(:slot)

	def winner
		if team1_score.nil? || team2_score.nil?
			nil
		elsif team1_score > team2_score
			team1
		else
			team2
		end
	end

	def finished?
		winner != nil
	end

	def set_region
		self.region = BracketMath::BracketMathHelper.get_region slot
	end

	def set_round
		self.round = BracketMath::BracketMathHelper.get_round slot
	end
end