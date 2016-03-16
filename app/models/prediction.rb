class Prediction < ActiveRecord::Base
	# properties
	attr_accessible :bracket, :winner, :slot, :round, :region, :winner_id

	# validations
	validates :bracket, :winner, :slot, :round, :region, :presence => true
	validates :slot, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 62 }
	
	# associations
	belongs_to :winner, :foreign_key => "winner_id", :class_name => "Team"
	belongs_to :game
	belongs_to :bracket

	# callbacks
	before_validation :set_region
	before_validation :set_round

	# scopes
	scope :slot, lambda { |s| where(:slot => s) }
	scope :round, lambda { |r| where(:round => r) }
	scope :region, lambda { |r| where(:region => r) }
	default_scope order(:slot)

	def set_region
		self.region = BracketMath::BracketMathHelper.get_region slot
	end

	def set_round
		self.round = BracketMath::BracketMathHelper.get_round slot
	end

	# returns true iff the game associated with this prediction has finished
	# and a winner has been determined
	def finished?
		Game.slot(slot).exists? && Game.slot(slot).first.finished?
	end

	# returns true iff the game is finished and the winner of the game
	# matches the predicted winner
	def correct?
		return finished? && Game.slot(slot).first.winner == winner
	end

	def incorrect?
		if finished? and not correct?
			return true
		else
			return false
		end
	end

	def color
		if correct?
			return 'green'
		elsif incorrect?
			return 'red'
		else
			return 'black'
		end
	end
end
