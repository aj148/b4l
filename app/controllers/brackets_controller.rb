class BracketsController < ApplicationController
	before_filter :authenticate_user!, except: [:edit, :update, :destroy, :show]
	before_filter :verify_bracket_user, only: [:edit, :update, :destroy, :show]


	def index
		# list all the brackets for the current user
		@brackets = current_user.brackets
		@referred = current_user.referred
		inactiveBrackets = []
		@brackets.each do |b|
			if (not b.active) 
				inactiveBrackets.push(b)
			end
		end

		logger.info("HEEYYYTY - " + inactiveBrackets.length.to_s)
		bracketsToActivate = (@referred / 3.0).to_i - (@brackets.length - inactiveBrackets.length)
		logger.info("HEEYYYwwTY - " + bracketsToActivate.to_s)
		for i in 0...bracketsToActivate
			if i < inactiveBrackets.length
				logger.info("HEEYYYY")
				inactiveBrackets[i].active = true;
				inactiveBrackets[i].save!
			end
		end
		
		@referral_url = request.base_url + "/users/sign_up?ref=" + current_user.id.to_s

		respond_to do |format|
			format.html  # index.html.erb
			format.json  { render :json => @brackets }
		end
	end

	def new
		# render a new bracket page
		# redirect_to root_path, :notice => "The time period for creating a bracket has closed, but you can still donate!"
		if current_user.brackets.length >= 3
			redirect_to root_path, :notice => "Sorry, you can only create 3 brackets at a time!"
		else
			@bracket ||= Bracket.new params[:bracket]
			@predictions = @bracket.predictions
			return
		end
	end

	def create
		require 'json'
		@bracket = current_user.brackets.new(:name => params[:bracket][:name])
		
		# parse the json part of the form to create prediction objects
		predictions = JSON.parse params[:bracket][:predictions]
		predictions.each_with_index do |winner_id, slot| 
			@bracket.predictions << Prediction.new(:slot => slot, :winner_id => winner_id, :bracket => @bracket)
		end

		@bracket.save

		if @bracket.predictions.length != 63
			flash[:notice] = "Bracket was invalid! Please try again"
			@bracket.destroy
			redirect_to brackets_path
			return
		end
		
		redirect_to new_payments_path(:bracket_id => @bracket.id)
	end

	def show

		@bracket = Bracket.find(params[:id])
		@predictions = @bracket.predictions.includes(:winner)
		if current_user.referred >= 3
			@bracket.update_score!
			@bracket.save!
		end	
	end

	def edit
		# render an edit page
	end

	def update
		# will update a users bracket
		@bracket = Bracket.find(params[:id])
		@bracket.update_score!
		@bracket.save!
	end

	def destroy
		Bracket.delete(params[:id])
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
