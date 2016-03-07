class ApplicationController < ActionController::Base
	$charities = [["CJ Foundation for SIDS", "CJ Foundation for SIDS"], ["Charlie's Kids", "Charlie's Kids"], 
	["Duke Cancer Patient Support Program", "Duke Cancer Patient Support Program"], ["Butler High School DECA Philanthropy", "Butler High School DECA Philanthropy"]]
	protect_from_forgery
end
