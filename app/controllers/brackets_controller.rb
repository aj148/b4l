class BracketsController < ApplicationController
	before_filter :authenticate_user!, except: [:edit, :update, :destroy, :show]
	before_filter :verify_bracket_user, only: [:edit, :update, :destroy, :show]


	def index
		# list all the brackets for the current user
		@brackets = current_user.brackets

		respond_to do |format|
			format.html  # index.html.erb
			format.json  { render :json => @brackets }
		end
	end

	def new
		# render a new bracket page
		redirect_to root_path, :notice => "The time period for creating a bracket has closed, but you can still donate!"
		return
		# @bracket ||= Bracket.new params[:bracket]
		# @predictions = @bracket.predictions
	end

	def create
		redirect_to root_path, :notice => "The time period for creating a bracket has closed, but you can still donate!"
		return	
		# require 'json'
		# @bracket = current_user.brackets.new(:name => params[:bracket][:name])
		
		# # parse the json part of the form to create prediction objects
		# predictions = JSON.parse params[:bracket][:predictions]
		# predictions.each_with_index do |winner_id, slot| 
		# 	@bracket.predictions << Prediction.new(:slot => slot, :winner_id => winner_id, :bracket => @bracket)
		# end

		# @bracket.save

		# if @bracket.predictions.count != 63
		# 	flash[:notice] = "Bracket was invalid! Please try again."
		# 	@bracket.destroy
		# 	redirect_to brackets_path
		# 	return
		# end
		
		# redirect_to new_payments_path(:bracket_id => @bracket.id)
	end

	def show
		@bracket = Bracket.find(params[:id])
		@predictions = @bracket.predictions.includes(:winner)
	end

	def edit
		# render an edit page
	end

	def update
		# will update a users bracket
	end

	def destroy
		@bracket.destroy
		redirect_to brackets_path
	end


	private

	def verify_bracket_user
		authenticate_user!
		@bracket = Bracket.find(params[:id])
		if @bracket.user != current_user
			render nothing: true, status: :forbidden
		end
	end

end
