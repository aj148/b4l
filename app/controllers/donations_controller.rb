class DonationsController < ApplicationController

	def new
	end

	def create
	  # Amount in cents
	  @amt = params[:payment_amt]

	  if @amt.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil
	  	@amt = 500
	  else
	  	@amt = @amt.to_i
	  end

	  email = "anonymous@mail.com"

	  if current_user
	  	email = current_user.email if !current_user.email.blank?
	  end

	  begin
	  	customer = Stripe::Customer.create(
	  		:email => email,
	  		:card  => params[:stripeToken]
	  		)

	  	charge = Stripe::Charge.create(
	  		:customer    => customer.id,
	  		:amount      => @amt,
	  		:description => 'Bracket Customer',
	  		:currency    => 'usd'
	  		)

	  rescue Stripe::CardError => e
	  	flash[:error] = e.message
	  else
	  	current_user.referred += (@amt.to_i / 500).to_i * 3;
	  	current_user.paid = current_user.paid || 0
	  	current_user.paid += @amt.to_i;
      	current_user.save!
	  end


	  # flash[:success] = "Thank You for your contribution!"
	  # redirect_to '/account'

	end
end