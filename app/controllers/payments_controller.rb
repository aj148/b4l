class PaymentsController < ApplicationController

  before_filter :authenticate_user!

  def new
    @bracket = Bracket.find(params[:bracket_id])
    @referral_url = request.base_url + "/users/sign_up?ref=" + current_user.id.to_s
    @referred = current_user.referred
  end

  def create
    @bracket = Bracket.find(params[:bracket_id])

    # Amount in cents
    @amt = params[:payment_amt]

    if @amt.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil
      @amt = 500
    else
      @amt = @amt.to_i
    end

    begin
      customer = Stripe::Customer.create(
       :email => current_user.email,
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
      @bracket.active = true
      @bracket.save!
    end

    flash[:alert] = "Thank You for your contribution!"
    redirect_to '/brackets'

  end


end
