class Team < ActiveRecord::Base
	# properties
	attr_accessible :name, :slot, :seed

	# validations
	validates :name, :slot, :seed, :presence => true
	validates :slot,  :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 63 }, :uniqueness => true

	# callbacks
	before_validation :set_seed

	# scopes
	scope :slot, lambda { |s| where(:slot => s) }
	default_scope order(:slot)

	@@seed_order = [1, 16, 8, 9, 5, 12, 4, 13, 6, 11, 3, 14, 7, 10, 2, 15]
	# set the seed based on the slot number
	# (using a clever mathematical pattern)
	def set_seed
		self.seed = @@seed_order[slot % 16]
	end
end
