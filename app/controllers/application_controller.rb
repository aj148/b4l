class ApplicationController < ActionController::Base
	$charities = [["CJ Foundation for SIDS", "CJ Foundation for SIDS"], ["Charlie's Kids", "Charlie's Kids"], 
	["Duke Cancer Patient Support Program", "Duke Cancer Patient Support Program"], ["Red Cross", "Red Cross"]]
	protect_from_forgery
end
